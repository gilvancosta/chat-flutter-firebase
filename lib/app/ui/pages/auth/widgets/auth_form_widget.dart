// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../../domain/identities/user_auth_identity.dart';

class AuthFormWidget extends StatefulWidget {
  final void Function(UserAuthIdentity) onSubmit;

  const AuthFormWidget({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final _formkey = GlobalKey<FormState>();
  final _formData = UserAuthIdentity();

  void _submit() {
    final isValid = _formkey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    widget.onSubmit(_formData);

    _formkey.currentState?.save();
    print(_formData.email);
    print(_formData.password);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: const EdgeInsets.all(20),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                if (_formData.isSignup)
                  TextFormField(
                    key: const ValueKey('name'),
                    initialValue: _formData.name,
                    onChanged: (value) => _formData.name = value,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      final nameValue = value ?? '';
                      if (nameValue.trim().length < 4) {
                        return 'Nome deve ter pelo menos 4 caracteres';
                      }
                      return null;
                    },
                  ),
                TextFormField(
                  key: const ValueKey('email'),
                  initialValue: _formData.email,
                  onChanged: (value) => _formData.email = value,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    final emailValue = value ?? '';
                    if (emailValue.trim().isEmpty || !emailValue.contains('@')) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  initialValue: _formData.password,
                  onChanged: (value) => _formData.password = value,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: (value) {
                    final passwordValue = value ?? '';
                    if (passwordValue.trim().isEmpty || passwordValue.trim().length < 6) {
                      return 'Senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _formData.toggleAuthMode();
                    });
                  },
                  child: Text(
                    _formData.isLogin ? 'Criar uma nova conta?' : 'Já possui conta?',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
