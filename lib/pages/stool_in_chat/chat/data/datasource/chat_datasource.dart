import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../core/chat_events_constants.dart';
import '../model/chat_messages_model.dart';
import '../model/chat_model.dart';
import '../model/create_chat_return_model.dart';

abstract class ChatDatasource {
  void createOrUpdateRoomMessages(
    ChatModel chatModel,
    Function(CreateChatReturnModel createChatReturnModel) emitEvent,
  );
  void findAllChats(
    ChatModel chatModel,
    Function(List<ChatModel> chatModel) emitEvent,
  );
  void join(
    ChatModel chatModel,
  ); // deve ser chamado dentro de createOrUpdateRoomMessages
  void typing(
    Map<String, dynamic> isTyping,
    Function(bool isTyping) emitEvent,
  );
  void deleteMessage({
    required Map<String, dynamic> messageId,
    required Map<String, dynamic> chatMessageId,
    required Map<String, dynamic> chatId,
    required Function(List<ChatModel> chatModel) emitEvent,
  });
}

class ChatDatasourceImpl implements ChatDatasource {
  final io.Socket _socket;
  ChatDatasourceImpl({
    required io.Socket socket,
  }) : _socket = socket;

  @override
  void createOrUpdateRoomMessages(
    ChatModel chatModel,
    Function(CreateChatReturnModel createChatReturnModel) emitEvent,
  ) {
    join(chatModel);
    _socket.emit(
      ChatEventsConstants.createOrUpdateRoom,
      chatModel.toMap(),
    );
    CreateChatReturnModel? createChatReturnModel;
    _socket.on(
      ChatEventsConstants.messagesEvent,
      (data) {
        log('Chat: $data');
        if (chatModel.createChat) {
          createChatReturnModel = CreateChatReturnModel(
            chatModel: ChatModel.fromMap(data),
          );
          emitEvent.call(createChatReturnModel!);
        } else {
          createChatReturnModel = CreateChatReturnModel(
            chatMessagesModel: ChatMessagesModel.fromMap(data),
          );
          emitEvent.call(createChatReturnModel!);
        }
      },
    );
  }

  @override
  void deleteMessage({
    required Map<String, dynamic> messageId,
    required Map<String, dynamic> chatMessageId,
    required Map<String, dynamic> chatId,
    required Function(List<ChatModel> chatModel) emitEvent,
  }) {
    final chats = <ChatModel>[];
    _socket.emit(ChatEventsConstants.deleteMessage, [
      messageId,
      chatMessageId,
      chatId,
    ]);
    _socket.on(
      ChatEventsConstants.messagesEvent,
      (data) {
        log('Chat: $data');
        final dataList = data as List;
        final chatAfterDelete =
            dataList.map((e) => ChatModel.fromMap(e)).toList();
        chats.addAll(chatAfterDelete);
        emitEvent.call(chats);
      },
    );
  }

  @override
  void findAllChats(
    ChatModel chatModel,
    Function(List<ChatModel> chatModel) emitEvent,
  ) {
    final chats = <ChatModel>[];
    _socket.emit(
      ChatEventsConstants.findAllChats,
      chatModel.toMap(),
    );
    _socket.on(
      ChatEventsConstants.allMessagesEvent,
      (data) {
        log('Chat: $data');
        final dataList = data as List;
        final chatModelList =
            dataList.map((e) => ChatModel.fromMap(e)).toList();
        chats.addAll(chatModelList);
        emitEvent.call(chats);
      },
    );
  }

  @override
  void join(ChatModel chatModel) {
    _socket.emit(
      ChatEventsConstants.join,
      chatModel.toMap(),
    );
  }

  @override
  void typing(
    Map<String, dynamic> isTyping,
    Function(bool isTyping) emitEvent,
  ) {
    bool isTyping = false;
    _socket.emit(
      ChatEventsConstants.typing,
      isTyping,
    );
    _socket.on(
      ChatEventsConstants.typingEvent,
      (data) {
        log('Chat: $data');
        isTyping = data;
        emitEvent.call(data);
      },
    );
  }
}
