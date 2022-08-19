import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  bool isLogin = false;

  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration =  const Duration(seconds: 3);
    return Timer(duration, route);
  }

  Future<bool> getLoginState() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogIn") ?? false;
  }

  route() async {
    isLogin = await getLoginState();
    if(isLogin){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/splash-map.png",
              ),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: Image.asset(
            "assets/loader-2.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
