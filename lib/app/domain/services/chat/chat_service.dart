import '../../../data/firebase_repository/chat/chat_firebase_repository.dart';
import '../../entities/chat/chat_entity.dart';
import '../../entities/user/user_identity.dart';

abstract class ChatService {
  Stream<List<ChatEntity>> messagesStream();

  Future<ChatEntity?> save(String text, UserIdentity user);

  factory ChatService() {
    //  return MessageMock();
    return ChatFirebaseRepository();
  }
}
