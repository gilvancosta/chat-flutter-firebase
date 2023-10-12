
import 'dart:io';

enum AuthModel { signup, login }

class UserIdentity {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthModel _mode = AuthModel.login;

bool get isLogin => _mode == AuthModel.login;
bool get isSignup => _mode == AuthModel.signup;

void toggleAuthMode() {
  _mode = isLogin ? AuthModel.signup : AuthModel.login;

}

}
