import 'dart:convert';

import '../../client_and_user/company_initial_data_model.dart';
import '../../client_and_user/create_client_model.dart';
import '../../domain/entity/chat_entity.dart';
import 'chat_messages_model.dart';

class ChatModel extends ChatEntity {
  final CreateClientModel? createClientModel;
  final CompanyInitialDataModel? companyInitialDataModel;
  final List<ChatMessagesModel> chatMessagesModel;
  ChatModel({
    super.id,
    required super.chatId,
    required super.createChat,
    required super.companyId,
    required super.clientId,
    this.createClientModel,
    this.companyInitialDataModel,
    required this.chatMessagesModel,
  }) : super(
          companyInitialDataEntity: companyInitialDataModel,
          clientEntity: createClientModel,
          chatMessages: chatMessagesModel,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'chatId': chatId});
    result.addAll({'createChat': createChat});
    if (companyId != null) {
      result.addAll({'enterpriseId': companyId});
    }
    if (clientId != null) {
      result.addAll({'clientId': clientId});
    }
    result
        .addAll({'messages': chatMessagesModel.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id']?.toInt(),
      chatId: map['chatId'] ?? '',
      createChat: map['createChat'] ?? false,
      companyId: map['enterpriseId']?.toInt() ?? 0,
      clientId: map['clientId']?.toInt() ?? 0,
      createClientModel: CreateClientModel.fromMap(map['clientData']),
      companyInitialDataModel:
          CompanyInitialDataModel.fromMap(map['companyData']),
      chatMessagesModel: List<ChatMessagesModel>.from(
        map['messages']?.map((x) => ChatMessagesModel.fromMap(x)),
      ),
    );
  }

  factory ChatModel.fromEntity(ChatEntity chatEntity) {
    return ChatModel(
      chatId: chatEntity.chatId,
      createChat: chatEntity.createChat,
      companyId: chatEntity.companyId,
      clientId: chatEntity.clientId,
      chatMessagesModel: chatEntity.chatMessages
          .map((e) => ChatMessagesModel.fromEntity(e))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));
}
