import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RegisPAge()));
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
