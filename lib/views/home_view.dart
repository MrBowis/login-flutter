import 'package:flutter/material.dart';
import 'package:login/controllers/login_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserController _userController = UserController();

  late final user;

  @override
  void initState() {
    super.initState();
    user = _userController.actualUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            user != null
                ? Text(
                  'Bienvenido, ${user?.user}!',
                  style: const TextStyle(fontSize: 24),
                )
                : const Text('Bienvenido!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                user != null
                    ? ElevatedButton(
                      onPressed: () {
                        _userController.LogOut();
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        'Log Out',
                        selectionColor: Colors.white,
                      ),
                    )
                    : ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Log In', selectionColor: Colors.white),
                    ),
                SizedBox(width: 20),
                if (user == null)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text('Sign Up', selectionColor: Colors.white),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
