
import '../../domain/entity/create_chat_return_entity.dart';
import 'chat_messages_model.dart';
import 'chat_model.dart';

class CreateChatReturnModel extends CreateChatReturnEntity {
  final ChatModel? chatModel;
  final ChatMessagesModel? chatMessagesModel;
  CreateChatReturnModel({
     this.chatModel,
     this.chatMessagesModel,
  }) : super(
          chatEntity: chatModel,
          chatMessagesEntity: chatMessagesModel,
        );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreateChatReturnModel &&
      other.chatModel == chatModel &&
      other.chatMessagesModel == chatMessagesModel;
  }

  @override
  int get hashCode => chatModel.hashCode ^ chatMessagesModel.hashCode;
}
