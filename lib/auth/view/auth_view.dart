import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/auth/controller/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  final localAuth = Get.find<LocalAuth>();

  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/login.jpg',
              fit: BoxFit.cover,
              height: Get.height,
              width: Get.width,
            ),
            Positioned(
              top: 80.0,
              right: 50.0,
              left: 50.0,
              child: Text(
                "Finexness",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.amberAccent),
              ),
            ),
            Positioned(
              bottom: 50.0,
              left: 50.0,
              right: 50.0,
              child: initialIndex == 0
                  ? Row(
                      children: [
                        Text(
                          'Dont have an account?',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                initialIndex = 1;
                              });
                              //Get.toNamed('/register');
                            },
                            child: const Text(
                              'SignIn ',
                              style: TextStyle(fontSize: 17.0),
                            )),
                      ],
                    )
                  : Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                initialIndex = 0;
                              });
                              //Get.toNamed('/login');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 17.0),
                            )),
                      ],
                    ),
            ),
            Positioned(
              bottom: 140.0,
              left: 50.0,
              right: 50.0,
              child: initialIndex == 0
                  ? Container(
                      height: Get.height * 0.5,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              key: const ValueKey("Email"),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "Email",
                                //fillColor: Colors.grey,
                                //filled: true,
                                /*border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )*/
                              ),
                              /*style: TextStyle(
                                color: Colors.white,
                              ),*/
                              controller: _emailController,
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              obscureText: true,
                              key: const ValueKey("password"),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "Password",
                                //fillColor: Colors.grey,
                                //filled: true,
                                /*border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),*/
                              ),
                              /* style: TextStyle(
                                color: Colors.white,
                              ),*/
                              controller: _passwordController,
                            ),
                            SizedBox(height: 10.0),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                child: Text('Forgot password'),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              key: const ValueKey("signIn"),
                              onPressed: () async {
                                authController.logIn(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    functionOnSuccess: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          "email", _emailController.text);
                                      prefs.setString(
                                          "password", _passwordController.text);
                                      prefs.setBool("loginWithFinger", false);
                                      Get.toNamed("/bottom_nav");
                                    });
                              },
                              child: const Text("Sign In"),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: Get.height * 0.5,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              key: const ValueKey("username"),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Username",
                                //fillColor: Colors.grey,
                                //filled: true,
                                /*border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),*/
                              ),
                              controller: _userController,
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              key: const ValueKey("email"),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "Email",
                                //fillColor: Colors.grey,
                                //filled: true,
                                /*border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),*/
                              ),
                              /* style: TextStyle(
                                color: Colors.white,
                              ),*/
                              controller: _emailController,
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              obscureText: true,
                              key: const ValueKey("password"),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: "Password",
                                //fillColor: Colors.grey,
                                //filled: true,
                                /*border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),*/
                              ),
                              /*style: TextStyle(
                                color: Colors.white,
                              ),*/
                              controller: _passwordController,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              key: const ValueKey("createAccount"),
                              onPressed: () async {
                                authController.createUser(
                                    firstName: _userController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text);
                              },
                              child: const Text("Create Account"),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
