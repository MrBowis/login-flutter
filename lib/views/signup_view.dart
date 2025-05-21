import 'package:flutter/material.dart';
import 'package:login/controllers/login_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameTC = TextEditingController();
  final TextEditingController _lasNameTC = TextEditingController();
  final TextEditingController _userTC = TextEditingController();
  final TextEditingController _passTC = TextEditingController();
  final TextEditingController _confirmPasswordTC = TextEditingController();

  final TextEditingController _emailTC = TextEditingController();
  final TextEditingController _phoneTC = TextEditingController();
  final TextEditingController _stateTC = TextEditingController();
  final TextEditingController _cityTC = TextEditingController();
  final TextEditingController _zipCodeTC = TextEditingController();


  UserController _userController = UserController();

  void _signUp() {
    final name = _userTC.text;
    final user = _userTC.text;
    final pass = _passTC.text;

    if (_userController.signUp(name, user, pass)) {
      print("✅ Usuario registrado correctamente.");
    } else {
      print("❌ El usuario con ese nombre ya existe.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _nameTC,
                        decoration: const InputDecoration(labelText: 'Nombre'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _lasNameTC,
                        decoration: const InputDecoration(
                          labelText: 'Apellido',
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _userTC,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _passTC,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _confirmPasswordTC,
                        decoration: const InputDecoration(
                          labelText: 'Confirmar Contraseña',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _emailTC,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _phoneTC,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _stateTC,
                        decoration: const InputDecoration(
                          labelText: 'Provincia',
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _cityTC,
                        decoration: const InputDecoration(labelText: 'Ciudad'),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _zipCodeTC,
                        decoration: const InputDecoration(
                          labelText: 'Código Postal',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
