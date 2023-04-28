
import 'chat_entity.dart';
import 'chat_messages_entity.dart';

class CreateChatReturnEntity {
  final ChatEntity? chatEntity;
  final ChatMessagesEntity? chatMessagesEntity;
  CreateChatReturnEntity({
     this.chatEntity,
     this.chatMessagesEntity,
  });
}
