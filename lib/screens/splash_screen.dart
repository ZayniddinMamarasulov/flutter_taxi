import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogIn = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  Future<bool> getLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogIn") ?? false;
  }

  route() async {
    _isLogIn = await getLoginState();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _isLogIn ? HomeScreen() : SignInScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/splash_background.png'))),
        child: Center(
          child: Image.asset(
            'assets/splash_logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
