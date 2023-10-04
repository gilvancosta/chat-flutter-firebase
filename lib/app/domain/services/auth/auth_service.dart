import 'dart:io';

import 'package:chat_flutter_firebase/app/domain/services/auth/auth_mock_service.dart';

import '../../entities/chat/chat_user_identity.dart';

abstract class AuthService {
  ChatUserIdentity? get currentUser;

  Stream<ChatUserIdentity?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

factory AuthService() {
  return AuthMockService();
}



}
