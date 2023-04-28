import 'package:dartz/dartz.dart';

import '../entity/chat_entity.dart';
import '../entity/create_chat_return_entity.dart';
import '../error/chat_error.dart';
import '../repository/chat_repository.dart';

abstract class ChatUsecase {
  Either<ChatError, void> createOrUpdateRoomMessages(
    ChatEntity chatEntity,
    Function(CreateChatReturnEntity createChatReturnEntity) emitEvent,
  );
  Either<ChatError, void> findAllChats(
    ChatEntity chatEntity,
    Function(List<ChatEntity> chatEntity) emitEvent,
  );
  Either<ChatError, void> join(
    ChatEntity chatEntity,
  ); // deve ser chamado dentro de createOrUpdateRoomMessages
  Either<ChatError, void> typing(
    Map<String, dynamic> isTyping,
    Function(bool isTyping) emitEvent,
  );
  Either<ChatError, void> deleteMessage({
    required Map<String, dynamic> messageId,
    required Map<String, dynamic> chatMessageId,
    required Map<String, dynamic> chatId,
    required Function(List<ChatEntity> chatEntity) emitEvent,
  });
}

class ChatUsecaseImpl implements ChatUsecase {
  final ChatRepository _chatRepository;
  ChatUsecaseImpl({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  @override
  Either<ChatError, void> createOrUpdateRoomMessages(
    ChatEntity chatEntity,
    Function(CreateChatReturnEntity createChatReturnEntity) emitEvent,
  ) {
    return _chatRepository.createOrUpdateRoomMessages(
      chatEntity,
      emitEvent,
    );
  }

  @override
  Either<ChatError, void> deleteMessage({
    required Map<String, dynamic> messageId,
    required Map<String, dynamic> chatMessageId,
    required Map<String, dynamic> chatId,
    required Function(List<ChatEntity> chatEntity) emitEvent,
  }) {
    return _chatRepository.deleteMessage(
      messageId: messageId,
      chatMessageId: chatMessageId,
      chatId: chatId,
      emitEvent: emitEvent,
    );
  }

  @override
  Either<ChatError, void> findAllChats(
    ChatEntity chatEntity,
    Function(List<ChatEntity> chatEntity) emitEvent,
  ) {
    return _chatRepository.findAllChats(chatEntity, emitEvent);
  }

  @override
  Either<ChatError, void> join(ChatEntity chatEntity) {
    return _chatRepository.join(chatEntity);
  }

  @override
  Either<ChatError, void> typing(
    Map<String, dynamic> isTyping,
    Function(bool isTyping) emitEvent,
  ) {
    return _chatRepository.typing(isTyping, emitEvent);
  }
}
