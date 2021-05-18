import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/auth/controller/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authController = Get.find<AuthController>();
  final localAuth = Get.find<LocalAuth>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                    decoration: InputDecoration(
                        hintText: "Username",
                        fillColor: Colors.grey,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: _emailController,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    obscureText: true,
                    key: const ValueKey("password"),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
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
                          password: _passwordController.text,functionOnSuccess: ()async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("email", _emailController.text);
                        prefs.setString("password", _passwordController.text);
                        Get.toNamed("/bottom_nav");
                      });
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
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final isAvailable = await localAuth.hasBiometrics();
                        if (isAvailable) {
                          final isAuthenticated =
                              await localAuth.authenticate();
                          if (isAuthenticated) {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            authController.logIn(
                                email: prefs.getString("email"),
                                password: prefs.getString("password"),functionOnSuccess: ()async{
                              Get.toNamed("/bottom_nav");
                            });
                          }
                        }
                        //final biometrics = await localAuth.getBiometrics();
                      }),
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
