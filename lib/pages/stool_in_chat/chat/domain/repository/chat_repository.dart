import 'package:dartz/dartz.dart';

import '../entity/chat_entity.dart';
import '../entity/create_chat_return_entity.dart';
import '../error/chat_error.dart';

abstract class ChatRepository {
  Either<ChatError, void> createOrUpdateRoomMessages(
    ChatEntity chatEntity,
    Function(CreateChatReturnEntity createChatReturnEntity) emitEvent,
  );
  Either<ChatError,void> findAllChats(
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
