import '../../entities/chat/chat_message_entity.dart';
import '../../entities/user/user_identity.dart';
import '../../../data/mock/chat/chat_mock.dart';

abstract class ChatService {
  Stream<List<ChatMessageEntity>> messagesStream();
  Future<ChatMessageEntity> save(String texto, UserIdentity user);

  factory ChatService() {
    return ChatMock();
  }
}
