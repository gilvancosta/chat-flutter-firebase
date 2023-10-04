
import 'dart:io';

enum UserAuthMode { signup, login }

class UserAuthIdentity {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  UserAuthMode _mode = UserAuthMode.login;

bool get isLogin => _mode == UserAuthMode.login;
bool get isSignup => _mode == UserAuthMode.signup;

void toggleAuthMode() {
  _mode = isLogin ? UserAuthMode.signup : UserAuthMode.login;

}

}
