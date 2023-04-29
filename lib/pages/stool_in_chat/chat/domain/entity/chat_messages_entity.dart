class ChatMessagesEntity {
  final int? id;
  final DateTime? createdAt;
  final String message;
  final int? fatherChatId;
  ChatMessagesEntity({
    this.id,
    this.createdAt,
    required this.message,
    required this.fatherChatId,
  });
}
