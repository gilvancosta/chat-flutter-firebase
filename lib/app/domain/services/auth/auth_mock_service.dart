import 'dart:io';
import 'dart:async';
import 'dart:math';

import '../../identities/user_identity.dart';
import 'auth_service.dart';


class AuthMockService implements AuthService {
  static final Map<String, UserIdentity> _users = {};
  static UserIdentity? _currentUser;
  static MultiStreamController<UserIdentity?>? _controller;
  static final _userStream = Stream<UserIdentity?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  @override
  UserIdentity? get currentUser {
    return _currentUser;
  }

  @override
  Stream<UserIdentity?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = UserIdentity(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageUrl: image?.path ?? '/assets/images/...',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(UserIdentity? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
