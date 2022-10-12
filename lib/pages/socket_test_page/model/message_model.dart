import 'dart:convert';

class MessageModel {
  final String firebaseId;
  final String sendImage;
  final String userName;
  final int? cliendId;
  final int? enterpriseId;
  final String? message;
  MessageModel({
    required this.firebaseId,
    required this.sendImage,
    required this.userName,
    this.message,
    this.cliendId,
    this.enterpriseId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firebaseUuid': firebaseId});
    if (message != null) {
      result.addAll({'message': message});
    }
    result.addAll({'senderImageUrlImage': sendImage});
    if (cliendId != null) {
      result.addAll({'clientId': cliendId});
    }
    if (enterpriseId != null) {
      result.addAll({'enterpriseId': enterpriseId});
    }
    result.addAll({'sendername': userName});

    return result;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
        firebaseId: map['firebaseUuid'] ?? '',
        sendImage: map['senderImageUrlImage'] ?? '',
        cliendId: map['clientId'],
        enterpriseId: map['enterpriseId'],
        message: map['message'],
        userName: map['sendername']);
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageModel(firebaseId: $firebaseId, sendImage: $sendImage, cliendId: $cliendId, enterpriseId: $enterpriseId, message: $message)';
  }
}

/*
message: string;
  firebaseUuid: string;
  senderImageUrlImage: string;
  sendername: string;
  clientId?: number;
  enterpriseId?: number;
*/