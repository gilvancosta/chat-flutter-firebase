// ignore_for_file: avoid_print

import 'package:chat_flutter_firebase/app/domain/services/auth/user_service.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/auth/user_identity.dart';
import 'widgets/auth_form_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isloading = false;

  Future<void> _handleSubmit(UserIdentity formData) async {
    try {
      setState(() {
        _isloading = true;
      });

      if (formData.isLogin) {
        await UserService().login(
          formData.email,
          formData.password,
        );
      } else {
        await UserService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }
    } catch (e) {
      // TODO
    } finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: AuthFormWidget(onSubmit: _handleSubmit),
              ),
            ),
            if (_isloading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ));
  }
}
