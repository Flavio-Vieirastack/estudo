class ChatEventsConstants {
  static const createOrUpdateRoom = 'create-or-update-room';
  static const findAllChats = 'find-all-chats';
  static const join = 'join';
  static const typing = 'typing';
  static const deleteMessage = 'delete-message';
  static const typingEvent = 'typing-event';
  static const messagesEvent = 'message';
  static const allMessagesEvent = 'all-messages';
  static Map<String, dynamic> isTyping(bool isTyping) {
    return {'isTyping': isTyping};
  }
  static Map<String, dynamic> messageId(int messageId) {
    return {'message-id': messageId};
  }
  static Map<String, dynamic> chatMessageId(int chatMessageId) {
    return {'chat-message-id': chatMessageId};
  }
  static Map<String, dynamic> chatId(int chatId) {
    return {'chat-id': chatId};
  }
}
