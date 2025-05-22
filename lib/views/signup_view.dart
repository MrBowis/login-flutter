import 'package:flutter/material.dart';
import 'package:login/controllers/login_controller.dart';
import 'package:login/models/login_model.dart';

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

  final UserController _userController = UserController();

  String _passwordError = '';
  String _confirmPasswordError = '';
  String _emailError = '';
  String _phoneError = '';
  String _zipCodeError = '';
  String _fieldError = '';

  void _comparePasswords(String value) {
    setState(() {
      _confirmPasswordTC.text = value;
      if (_passTC.text != _confirmPasswordTC.text) {
        _confirmPasswordError = "Las contraseñas no coinciden.";
      } else {
        _confirmPasswordError = "";
      }
    });
  }

  void _validateEmail(String value) {
    setState(() {
      final email = _emailTC.text;
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      if (!emailRegex.hasMatch(email)) {
        _emailError = "El correo electrónico no es válido.";
      } else {
        _emailError = "";
      }
    });
  }

  void _validatePhone(String value) {
    setState(() {
      final phone = _phoneTC.text;
      final phoneRegex = RegExp(r'^\d{10}$');
      if (!phoneRegex.hasMatch(phone)) {
        _phoneError = "El número de teléfono no es válido.";
      } else {
        _phoneError = "";
      }
    });
  }

  void _validateZipCode(String value) {
    setState(() {
      final zipCode = _zipCodeTC.text;
      final zipCodeRegex = RegExp(r'^\d{5}$');
      if (!zipCodeRegex.hasMatch(zipCode)) {
        _zipCodeError = "El código postal no es válido.";
      } else {
        _zipCodeError = "";
      }
    });
  }

  void _requiredFields() {
    setState(() {
      if (_userTC.text.isEmpty ||
          _passTC.text.isEmpty ||
          _confirmPasswordTC.text.isEmpty) {
        _fieldError = "Revisar los campos que son obligatorios.";
      } else {
        _fieldError = "";
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      final password = value;
      final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
      if (!passwordRegex.hasMatch(password)) {
        _passwordError = "La contraseña no es válida.";
      } else {
        _passwordError = '';
      }
    });
  }

  bool _signUp() {
    final name = _nameTC.text;
    final lastName = _lasNameTC.text;
    final user = _userTC.text;
    final pass = _passTC.text;
    final email = _emailTC.text;
    final phone = _phoneTC.text;
    final state = _stateTC.text;
    final city = _cityTC.text;
    final zipCode = _zipCodeTC.text;

    User newUser = User(
      name: name,
      lastName: lastName,
      user: user,
      pass: pass,
      email: email,
      phone: phone,
      direction: {'city': city, 'state': state, 'zipCode': zipCode},
    );

    if (_userController.signUp(newUser)) {
      print("✅ Usuario registrado correctamente.");
      return true;
    } else {
      print("❌ El usuario con ese nombre ya existe.");
      return false;
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
                        onChanged: _validatePassword,
                      ),
                    ),
                    if (_passwordError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          _passwordError,
                          style: TextStyle(color: Colors.red),
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
                        onChanged: _comparePasswords,
                      ),
                    ),
                    if (_confirmPasswordError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          _confirmPasswordError,
                          style: TextStyle(color: Colors.red),
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
                        onChanged: _validateEmail,
                      ),
                    ),
                    if (_emailError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          _emailError,
                          style: TextStyle(color: Colors.red),
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
                        onChanged: _validatePhone,
                      ),
                    ),
                    if (_phoneError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          _phoneError,
                          style: TextStyle(color: Colors.red),
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
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _cityTC,
                        decoration: const InputDecoration(labelText: 'Ciudad'),
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
                        onChanged: _validateZipCode,
                      ),
                    ),
                    if (_zipCodeError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          _zipCodeError,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 64),
            if (_fieldError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(_fieldError, style: TextStyle(color: Colors.red)),
              ),
            ElevatedButton(
              onPressed: () {
                _requiredFields();
                if (_fieldError.isEmpty &&
                    _passwordError.isEmpty &&
                    _confirmPasswordError.isEmpty &&
                    _zipCodeError.isEmpty) {
                  if (_signUp()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Usuario registrado correctamente.'),
                      ),
                    );
                    Navigator.pushNamed(context, '/');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, ingrese los campos necesarios'),
                      ),
                    );
                    print("❌ Error al registrar el usuario.");
                  }
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
