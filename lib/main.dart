import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/splash_screen.dart';
import 'package:flutter_taxi/screens/verification_screen.dart';
import 'package:flutter_taxi/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: backgroundColor,
          ),
          backgroundColor: backgroundColor),
      initialRoute: '/',
      routes: {
        '/':(context) => const SplashScreen(),
        'verify': (context) => const VerificationScreen(),
      },
    );
  }
}
