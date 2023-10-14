import 'dart:async';
import 'dart:math';
import '../../../domain/entities/chat/message_entity.dart';

import '../../../domain/entities/user/user_identity.dart';
import '../../../domain/services/chat/chat_service.dart';

class MessageMock implements MessageService {
  static final List<MessageEntity> _msgs = [];

  static MultiStreamController<List<MessageEntity>>? _controller;

  static final _msgsStream = Stream<List<MessageEntity>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<MessageEntity>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<MessageEntity> save(String text, UserIdentity user) async {
    final newMessage = MessageEntity(
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
