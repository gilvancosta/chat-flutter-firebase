import 'dart:io';
import 'dart:async';
import 'dart:math';

import '../../../domain/entities/user/user_identity.dart';
import '../../../domain/services/user/user_service.dart';

class UserMock implements UserService {
  static final _defaultUser = UserIdentity(
    id: '1',
    name: 'John Doe',
    email: 'john@teste.com.br',
    imageUrl: '/assets/images/avatar.png',
  );

  static final Map<String, UserIdentity> _users = {
    _defaultUser.email: _defaultUser,
  };
  static UserIdentity? _currentUser;

  static MultiStreamController<UserIdentity?>? _controller;
  static final _userStream = Stream<UserIdentity?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
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
  Future<void> signup(String name, String email, String password, File? image) async {
    final newUser = UserIdentity(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageUrl: image?.path ?? '/assets/images/avatar.png',
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
