// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';

import '../../../domain/entities/user/user_identity.dart';
import '../../../domain/services/notification/chat_notification_service.dart';
import '../../../domain/services/user/user_service.dart';

import '../auth/auth_page.dart';
import '../chat/chat_page.dart';
import '../loading/loading_page.dart';
// import '../loading/loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> init(BuildContext context) async {
    // await Firebase.initializeApp();
    await Provider.of<ChatNotificationService>(
      context,
      listen: false,
    ).init();
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
