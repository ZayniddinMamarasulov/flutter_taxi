import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isLogin') ?? false;
  }

  route() async {
    bool isLogin = await getLoginState();
    isLogin
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  HomeScreen()))
        : Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => RegisterScreen()));
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
