import 'package:flutter/material.dart';
import 'package:project_test/pages/stool_in_chat/chat/presenter/core/chat_params.dart';

class ChatPage extends StatelessWidget {
  final ChatParams? chatParams;
  const ChatPage({
    Key? key,
    required this.chatParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
