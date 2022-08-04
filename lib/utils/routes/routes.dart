import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';
import 'package:flutter_taxi/screens/splash_screen.dart';

import 'routes_name.dart';

// routes
class Routes {
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
    return null;
  }
}
