import 'package:login/models/login_model.dart';
import 'package:crypto/crypto.dart';

class UserController {
  static final UserController _instance = UserController._intern();

  factory UserController() {
    return _instance;
  }

  UserController._intern();

  final List<User> _users = [];
  User? _actualUser;

  // Registro de usuario
  bool signUp(User user) {
    // Verificar si el correo ya existe
    final exist = _users.any((u) => u.user == user.user);
    if (exist) {
      return false;
    }

    // Crear y agregar usuario
    final newUser = User(
      name: user.name,
      user: user.user,
      pass: sha256.convert(user.pass.codeUnits).toString(),
    );
    _users.add(newUser);
    return true;
  }

  bool validateUser(String user, String pass) {
    for (var u in _users) {
      if (u.user == user && u.pass == sha256.convert(pass.codeUnits).toString()) {
        return true;
      }
    }
    return false;
  }

  User? logIn(String username, String password) {
    if (validateUser(username, password)) {
      final user = _users.firstWhere(
        (u) => u.user == username && u.pass == sha256.convert(password.codeUnits).toString(),
        orElse: () => User(name: '', user: '', pass: ''),
      );

      if (user.user.isNotEmpty) {
        _actualUser = user;
        return user;
      }
    }
    return null;
  }

  User? get actualUser => _actualUser;
  List<User> get users => _users;

  void LogOut() {
    _actualUser = null;
  }

  @override
  String toString() {
    for (var user in _users) {
      print('User: ${user.user}, Pass: ${user.pass}');
    }
    return '_actualUser: $_actualUser}';
  }
}
