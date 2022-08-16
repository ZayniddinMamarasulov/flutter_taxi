import 'package:flutter/material.dart';
import 'package:flutter_taxi/models/address.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';
import 'package:flutter_taxi/screens/splash_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/sign-in':
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case '/sign-up':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/':
        final userAddress =
            settings.arguments != null ? settings.arguments as Address : null;
        return MaterialPageRoute(
            builder: (_) => HomePage(userAddress: userAddress));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
