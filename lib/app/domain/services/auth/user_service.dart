import 'dart:io';

import 'package:chat_flutter_firebase/app/data/mock/user_mock.dart';

import '../../entities/user/user_identity.dart';

abstract class UserService {
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

factory UserService() {
  return UserMock();
}



}
