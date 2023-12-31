import 'dart:io';

import '../../../data/firebase_repository/user/user_firebase_repository.dart';
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
    //  return UserMock();

    return UserFirebaseRepository();
  }
}
