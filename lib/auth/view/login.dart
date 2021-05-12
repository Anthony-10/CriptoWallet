import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Builder(builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "G-Market",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Colors.amberAccent),
                  ),
                  SizedBox(height: 100.0),
                  TextFormField(
                    key: const ValueKey("username"),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "Username"),
                    controller: _emailController,
                  ),
                  TextFormField(
                    obscureText: true,
                    key: const ValueKey("password"),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    key: const ValueKey("signIn"),
                    onPressed: () async {
                      authController.logIn(
                          email: _emailController.text,
                          password: _passwordController.text);
                    },
                    child: const Text("Sign In"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.fingerprint,
                        size: 60.0,
                      ),
                      onPressed: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/register');
                      },
                      child: const Text('Dont have an account SignIn '))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
