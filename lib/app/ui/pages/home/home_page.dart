import 'package:flutter/material.dart';

import '../../../domain/entities/user/user_identity.dart';
import '../../../domain/services/auth/user_service.dart';


import '../auth/auth_page.dart';
import '../chat/chat_page.dart';
import '../loading/loading_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserIdentity?>(
      stream: UserService().userChanges,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else {
          return snapshot.hasData ? const ChatPage() : const AuthPage();
        }
      },
    );
  }
}
