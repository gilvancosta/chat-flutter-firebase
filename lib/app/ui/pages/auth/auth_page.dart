// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../domain/identities/user_auth_identity.dart';
import 'widgets/auth_form_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void _handleSubmit(UserAuthIdentity formData) {
    print(formData.email);
    print(formData.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blueGrey[300],
        body: Center(
            child: SingleChildScrollView(
      child: AuthFormWidget(onSubmit: _handleSubmit),
    )));
  }
}
