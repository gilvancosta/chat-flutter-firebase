import 'dart:async';
import 'dart:math';
import '../../entities/chat/chat_message_entity.dart';
import '../../entities/chat/chat_user_identity.dart';
import 'chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessageEntity> _msgs = [];
  static MultiStreamController<List<ChatMessageEntity>>? _controller;

  static final _msgsStream = Stream<List<ChatMessageEntity>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessageEntity>> messagesStream() {
    return _msgsStream;
  }


  @override
  Future<ChatMessageEntity> save(String text, ChatUserIdentity user) async {
    final newMessage = ChatMessageEntity(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());
    return newMessage;
  }

}
