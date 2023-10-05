import 'dart:io';
 import 'dart:async';
import 'dart:math';

import '../../entities/chat/chat_user_identity.dart';
import 'auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = ChatUserIdentity(
    id: '1',
    name: 'John Doe',
    email: 'gilvan@teste.com.br',
    imageUrl: '/assets/images/avatar.png',
  );

  static final Map<String, ChatUserIdentity> _users = {
    _defaultUser.email: _defaultUser,
  };
  static ChatUserIdentity? _currentUser;
  static MultiStreamController<ChatUserIdentity?>? _controller;
  static final _userStream = Stream<ChatUserIdentity?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUserIdentity? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUserIdentity?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = ChatUserIdentity(
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

  static void _updateUser(ChatUserIdentity? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
