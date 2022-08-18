import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';
import 'package:flutter_taxi/screens/splash_screen.dart';
import 'package:flutter_taxi/screens/verification_screen.dart';
import 'package:flutter_taxi/utils/routes.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case routeVerify:
        final phoneNumber =
            settings.arguments != null ? settings.arguments as String : null;
        return MaterialPageRoute(
            builder: (_) => VerificationScreen(phoneNumber!));
      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case routeSignIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case routeSignUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
