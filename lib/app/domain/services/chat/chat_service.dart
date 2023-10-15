import '../../entities/chat/chat_entity.dart';
import '../../entities/user/user_identity.dart';
import '../../../data/mock/chat/message_mock.dart';

abstract class ChatService {

  Stream<List<ChatEntity>> messagesStream();

  Future<ChatEntity?> save(String text, UserIdentity user);

  factory ChatService() {
    return MessageMock();
  }
}
