class ChatParams {
  final String chatId;
  final bool createChat;
  final int? companyId;
  final int? clientId;
  ChatParams({
    required this.chatId,
    required this.createChat,
    this.companyId,
    this.clientId,
  });

  ChatParams copyWith({
    String? chatId,
    bool? createChat,
    int? companyId,
    int? clientId,
  }) {
    return ChatParams(
      chatId: chatId ?? this.chatId,
      createChat: createChat ?? this.createChat,
      companyId: companyId ?? this.companyId,
      clientId: clientId ?? this.clientId,
    );
  }
}
