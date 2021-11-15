import 'package:flutter/material.dart';
import 'package:projeto01/controllers/login_Controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people,
                color: Colors.blueGrey[600],
                size: MediaQuery.of(context).size.height * 0.26),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: _controller.setLogin,
              decoration: const InputDecoration(
                label: Text('Login'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              onChanged: _controller.setPass,
              decoration: const InputDecoration(
                label: Text('Senha'),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.inloader,
              builder: (_, inloader, __) => inloader
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _controller.auth().then((result) {
                          if (result) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                              content: Text(
                                'Login ou senha incorretos!',
                                textAlign: TextAlign.center,
                              ),
                            ));
                          }
                        });
                      },
                      child: const Text('Login'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
