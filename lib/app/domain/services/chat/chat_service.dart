import '../../entities/chat/chat_message_entity.dart';
import '../../entities/chat/chat_user_identity.dart';
import 'chat_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessageEntity>> messagesStream();
  Future<ChatMessageEntity> save(String texto, ChatUserIdentity user);

  factory ChatService() {
    return ChatMockService();
  }
}
