// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hslr/screen/login/login.dart';

import '../../main.dart';
import '../dashboard/dashboard.dart';
// import 'package:planie_service/constants/planiecolors.dart';
// import 'package:planie_service/screens/login_otp/mobileotp.dart';
// import 'package:planie_service/screens/login_otp/otp.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Image.asset(
            'assets/FB.png',
            height: 440,
            width: 400,
            fit: BoxFit.cover,
          ),
        ),
        nextScreen:
            // sessionlog.getString('log_name') == null ?
            Login(),
        //  : Dashboard(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white);
  }
}
