
import '../../client_and_user/company_initial_data_entity.dart';
import '../../client_and_user/create_client_entity.dart';
import 'chat_messages_entity.dart';

class ChatEntity {
  final int? id;
  final String chatId;
  final bool createChat;
  final int? companyId;
  final int? clientId;
  final CreateClientEntity clientEntity;
  final CompanyInitialDataEntity companyInitialDataEntity;
  final List<ChatMessagesEntity> chatMessages;
  ChatEntity({
    required this.chatId,
    this.createChat = false,
    required this.companyId,
    required this.clientId,
    required this.clientEntity,
    required this.companyInitialDataEntity,
    required this.chatMessages,
    this.id,
  });
}
