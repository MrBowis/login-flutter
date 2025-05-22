import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/controllers/login_controller.dart';
import 'package:login/models/login_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();

  final _userController = UserController();

  late final users;

  @override
  void initState() {
    super.initState();
    users = _userController.users;
  }

  bool _login() {
    print(_userController.toString());
    final user = _userController.logIn(
      _userTextController.text,
      _passTextController.text,
    );

    if (user != null) {
      Navigator.pushNamed(context, '/');
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _userTextController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _passTextController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 64),
                ElevatedButton(
                  onPressed: () {
                    if (_userTextController.text.isEmpty ||
                        _passTextController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, ingrese todos los campos'),
                        ),
                      );
                      return;
                    }
                    if (_login()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Bienvenido')),
                      );
                    }
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Log In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
