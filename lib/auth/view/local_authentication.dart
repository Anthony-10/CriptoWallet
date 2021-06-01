import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/auth/controller/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthentication extends StatefulWidget {
  const LocalAuthentication({Key key}) : super(key: key);

  @override
  _LocalAuthenticationState createState() => _LocalAuthenticationState();
}

class _LocalAuthenticationState extends State<LocalAuthentication>
    with SingleTickerProviderStateMixin {
  /*AnimationController _animationController;
  bool isAuth = false;
*/

  /* @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }*/
  final authController = Get.find<AuthController>();
  final localAuth = Get.find<LocalAuth>();

  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Icon(
                Icons.lock,
                color: Colors.amberAccent,
                size: 35.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Finexness Locked',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
              SizedBox(
                height: 150.0,
              ),
              IconButton(
                  iconSize: 70.0,
                  icon: Icon(
                    Icons.fingerprint,
                    size: 70.0,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    final isAvailable = await localAuth.hasBiometrics();
                    if (isAvailable) {
                      final isAuthenticated = await localAuth.authenticate();
                      if (isAuthenticated) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        authController.logIn(
                            email: prefs.getString("email"),
                            password: prefs.getString("password"),
                            functionOnSuccess: () async {
                              Get.toNamed("/bottom_nav");
                              prefs.setBool("loginWithFinger", true);
                            });
                      }
                    }
                    isAuth = true;
                    //final biometrics = await localAuth.getBiometrics();
                  }),
              SizedBox(
                height: 50.0,
              ),
              Text('Touch the fingerprint sensor',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
