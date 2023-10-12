import '../../entities/chat/message_entity.dart';
import '../../entities/user/user_identity.dart';
import '../../../data/mock/chat/message_mock.dart';

abstract class MessageService {
  Stream<List<MessageEntity>> messagesStream();
  Future<MessageEntity> save(String texto, UserIdentity user);

  factory MessageService() {
    return MessageMock();
  }
}
