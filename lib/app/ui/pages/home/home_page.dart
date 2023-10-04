import 'package:flutter/material.dart';

import '../../../domain/entities/chat/chat_user_identity.dart';

import '../../../domain/services/auth/auth_service.dart';
import '../auth/auth_page.dart';
import '../chat/chat_page.dart';
import '../loading/loading_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUserIdentity?>(
        stream: AuthService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthPage();
          }
        },
      ),
    );
  }
}
