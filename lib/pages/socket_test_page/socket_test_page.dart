import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_test/pages/socket_test_page/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketTestPage extends StatefulWidget {
  const SocketTestPage({Key? key}) : super(key: key);

  @override
  State<SocketTestPage> createState() => _SocketTestPageState();
}

class _SocketTestPageState extends State<SocketTestPage> {
  List<MessageModel> messages = [];
  late final io.Socket socket;
  final controller = TextEditingController();
  late final String room;
  connect() {
    socket.onConnect((data) => log('connected $data'));
    socket.onConnectError((data) => log('error $data'));
    socket.onDisconnect((data) => log('disconnected $data'));
    socket.on('createRoom', (data) {
      log(data.toString());
      final map = data as Map<String, dynamic>;
      final model = MessageModel.fromMap(map);
      log('messages model $model');
      setState(() {
        messages.add(model);
        log(messages.toString());
      });
    });
  }

  sendMessage() {
    socket.emit(
      'createRoom',
      MessageModel(
        firebaseId: room,
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
  }

  @override
  void initState() {
    super.initState();
    socket = io.io(
      'http://localhost:3000',
      io.OptionBuilder().setTransports(['websocket']).build(),
    );
    connect();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      room = ModalRoute.of(context)?.settings.arguments as String;
      log('Room $room');
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
      body: ListView(
        children: messages
            .map((e) => Container(
                  color: Colors.red,
                  child: Text(e.message ?? ''),
                ))
            .toList(),
      ),
    );
  }
}
