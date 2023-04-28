import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../domain/entity/chat_entity.dart';
import '../../domain/entity/create_chat_return_entity.dart';
import '../../domain/error/chat_error.dart';
import '../../domain/repository/chat_repository.dart';
import '../datasource/chat_datasource.dart';
import '../model/chat_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDatasource _chatDatasource;
  ChatRepositoryImpl({
    required ChatDatasource chatDatasource,
  }) : _chatDatasource = chatDatasource;

  @override
  Either<ChatError, void> createOrUpdateRoomMessages(
    ChatEntity chatEntity,
    Function(CreateChatReturnEntity createChatReturnEntity) emitEvent,
  ) {
    try {
      final result = _chatDatasource.createOrUpdateRoomMessages(
        ChatModel.fromEntity(
          chatEntity,
        ),
        emitEvent,
      );
      return Right(result);
    } catch (e, s) {
      log('defaultErrorMessage()', error: e, stackTrace: s);
      return Left(ChatError());
    }
  }

  @override
  Either<ChatError, void> deleteMessage({
    required Map<String, dynamic> messageId,
    required Map<String, dynamic> chatMessageId,
    required Map<String, dynamic> chatId,
    required Function(List<ChatEntity> chatEntity) emitEvent,
  }) {
    try {
      final result = _chatDatasource.deleteMessage(
        messageId: messageId,
        chatMessageId: chatMessageId,
        chatId: chatId,
        emitEvent: emitEvent,
      );
      return Right(result);
    } catch (e, s) {
      log('defaultErrorMessage()', error: e, stackTrace: s);
      return Left(ChatError());
    }
  }

  @override
  Either<ChatError, void> findAllChats(
    ChatEntity chatEntity,
    Function(List<ChatEntity> chatEntity) emitEvent,
  ) {
    try {
      final result = _chatDatasource.findAllChats(
        ChatModel.fromEntity(chatEntity),
        emitEvent,
      );
      return Right(result);
    } catch (e, s) {
      log('defaultErrorMessage()', error: e, stackTrace: s);
      return Left(ChatError());
    }
  }

  @override
  Either<ChatError, void> join(ChatEntity chatEntity) {
    try {
      final result = _chatDatasource.join(ChatModel.fromEntity(chatEntity));
      return Right(result);
    } catch (e, s) {
      log('defaultErrorMessage()', error: e, stackTrace: s);
      return Left(ChatError());
    }
  }

  @override
  Either<ChatError, void> typing(
    Map<String, dynamic> isTyping,
    Function(bool isTyping) emitEvent,
  ) {
    try {
      final result = _chatDatasource.typing(isTyping, emitEvent);
      return Right(result);
    } catch (e, s) {
      log('defaultErrorMessage()', error: e, stackTrace: s);
      return Left(ChatError());
    }
  }
}
