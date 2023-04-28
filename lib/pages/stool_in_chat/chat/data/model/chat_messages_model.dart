import 'dart:convert';

import '../../domain/entity/chat_messages_entity.dart';


class ChatMessagesModel extends ChatMessagesEntity {
  ChatMessagesModel({
    super.id,
    super.createdAt,
    required super.message,
    required super.fatherChatId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'message': message});

    result.addAll({'chatId': fatherChatId});

    return result;
  }

  factory ChatMessagesModel.fromMap(Map<String, dynamic> map) {
    return ChatMessagesModel(
      id: map['id']?.toInt(),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      message: map['message'],
      fatherChatId: map['chatId']?.toInt() ?? 0,
    );
  }

  factory ChatMessagesModel.fromEntity(ChatMessagesEntity chatMessagesEntity) {
    return ChatMessagesModel(
      message: chatMessagesEntity.message,
      fatherChatId: chatMessagesEntity.fatherChatId,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessagesModel.fromJson(String source) =>
      ChatMessagesModel.fromMap(json.decode(source));
}
