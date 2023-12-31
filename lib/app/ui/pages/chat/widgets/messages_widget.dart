import 'package:flutter/material.dart';

import 'package:chat_flutter_firebase/app/domain/entities/chat/chat_entity.dart';
import 'package:chat_flutter_firebase/app/domain/services/user/user_service.dart';

import 'package:chat_flutter_firebase/app/ui/pages/chat/widgets/message_bubble_widget.dart';

import '../../../../domain/services/chat/chat_service.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = UserService().currentUser;
    return StreamBuilder<List<ChatEntity>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Sem dados. Vamos conversar?'));
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (ctx, i) => MessageBubbleWidget(
              key: ValueKey(msgs[i].id),
              message: msgs[i],
              belongsToCurrentUser: currentUser?.id == msgs[i].userId,
            ),
          );
        }
      },
    );
  }
}
