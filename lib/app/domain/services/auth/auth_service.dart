import 'dart:io';

import '../../identities/user_identity.dart';

abstract class AuthService {
  UserIdentity? get currentUser;

  Stream<UserIdentity?> get userChanges;

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
}
