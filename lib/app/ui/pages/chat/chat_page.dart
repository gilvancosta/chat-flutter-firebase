import 'package:flutter/material.dart';
import '../../../domain/services/auth/auth_service.dart';
import 'widgets/messages_widget.dart';
import 'widgets/new_message_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Chat'),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            MessagesWidget(),
            NewMessageWidget(),
          ],
        ),
      ),
    );
  }
}
