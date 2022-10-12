import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_test/pages/socket_test_page/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

class SocketTestPage extends StatefulWidget {
  const SocketTestPage({Key? key}) : super(key: key);
  @override
  State<SocketTestPage> createState() => _SocketTestPageState();
}

class _SocketTestPageState extends State<SocketTestPage> {
  final streamSocket = StreamSocket();
  List<MessageModel> messages = [];
  late final String? room;
  final messageEvent = 'createRoom';
  final joinEvent = 'join';
  final findAllEvent = 'findAllChat';
  final io.Socket socket = io.io(
    'http://localhost:3000',
    io.OptionBuilder().setTransports(['websocket']).build(),
  );
  final controller = TextEditingController();
  connect() {
    socket.onConnect((data) {
      log('Connected');
      socket.emit(findAllEvent, (data) {
        log('all messages $data');
      });
      socket.emit(joinEvent, [
        MessageModel(
          firebaseId: 'firebaseId',
          sendImage: 'sendImage',
          userName: 'userName',
        ),
        (data) {
          log('Join event data $data');
        }
      ]);
    });
    socket.onConnectError((data) => log('error $data'));
    socket.onDisconnect((data) => log('disconnected $data'));
  }

  sendMessage() {
    socket.emit(
      messageEvent,
      MessageModel(
        userName: 'name1',
        firebaseId: 'a',
        sendImage: 'sendImage',
        message: controller.text,
      ).toMap(),
    );
    controller.clear();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    streamSocket.dispose();
  }

  @override
  void initState() {
    super.initState();
    connect();
    socket.on(messageEvent, (data) {
      log('dados reecebidos da mensagem $messageEvent');
      streamSocket.addResponse(data['message']);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      room = ModalRoute.of(context)?.settings.arguments as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Wrap(
        children: [
          TextField(
            controller: controller,
          ),
          TextButton(
            onPressed: () => sendMessage(),
            child: const Text('Enviar'),
          )
        ],
      ),
      appBar: AppBar(
        title: const Text('Socket'),
      ),
      body: StreamBuilder<String>(
        stream: streamSocket.getResponse,
        initialData: 'Sem dados',
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            children: [
              Text(
                snapshot.data.toString(),
              ),
            ],
          );
        },
      ),
    );
  }
}
