import 'dart:developer';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/pages/stool_in_chat/chat/data/datasource/chat_datasource.dart';
import 'package:project_test/pages/stool_in_chat/chat/data/repository/chat_repository_impl.dart';
import 'package:project_test/pages/stool_in_chat/chat/domain/entity/chat_entity.dart';
import 'package:project_test/pages/stool_in_chat/chat/domain/usecase/chat_usecase.dart';
import 'package:project_test/pages/stool_in_chat/chat/presenter/bloc/chat_states.dart';
import 'package:project_test/pages/stool_in_chat/chat/presenter/core/chat_params.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../domain/entity/chat_messages_entity.dart';

class ChatBloc extends FlutterGetItBloc<ChatStates> {
  final chatMessages = <ChatMessagesEntity>[];
  final chatUsecase = ChatUsecaseImpl(
    chatRepository: ChatRepositoryImpl(
      chatDatasource: ChatDatasourceImpl(
        socket: io.io(
          'http://localhost:3000',
          io.OptionBuilder().setTransports(['websocket']).build(),
        ),
      ),
    ),
  );

  void connect(
    ChatParams chatParams,
    String message,
  ) {
    int? fatherChatId;
    if (chatParams.createChat) {
      chatMessages.add(
        ChatMessagesEntity(
          message: message,
          fatherChatId: null,
        ),
      );
      chatParams.copyWith(createChat: false);
    } else {
      chatMessages.add(
        ChatMessagesEntity(
          message: message,
          fatherChatId: fatherChatId,
        ),
      );
    }
    chatUsecase.createOrUpdateRoomMessages(
      ChatEntity(
        chatId: chatParams.chatId,
        companyId: chatParams.companyId,
        clientId: chatParams.clientId,
        chatMessages: chatMessages,
        createChat: chatParams.createChat,
      ),
      (createChatReturnEntity) {
        log(createChatReturnEntity.toString());
        fatherChatId = createChatReturnEntity.chatEntity?.id;
        log('FatherChatId: $fatherChatId');
        chatMessages.add(createChatReturnEntity.chatMessagesEntity!);
        log('Chat messages: $chatMessages');
      },
    );
  }
}
