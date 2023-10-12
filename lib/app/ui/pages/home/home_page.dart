import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../domain/entities/user/user_identity.dart';
import '../../../domain/services/auth/user_service.dart';

import '../auth/auth_page.dart';
import '../chat/chat_page.dart';
import '../loading/loading_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> init(BuildContext context) async {
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else {
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
      },
    );
  }
}
