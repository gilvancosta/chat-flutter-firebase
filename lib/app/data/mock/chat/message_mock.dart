import 'dart:async';
import 'dart:math';
import '../../../domain/entities/chat/chat_entity.dart';

import '../../../domain/entities/user/user_identity.dart';
import '../../../domain/services/chat/chat_service.dart';

class MessageMock implements ChatService {
  static final List<ChatEntity> _msgs = [];

  static MultiStreamController<List<ChatEntity>>? _controller;

  static final _msgsStream = Stream<List<ChatEntity>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatEntity>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatEntity> save(String text, UserIdentity user) async {
    final newMessage = ChatEntity(
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
