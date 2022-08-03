import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/login_screen.dart';
import 'package:flutter_taxi/screens/signup_screen.dart';
import 'package:flutter_taxi/screens/splash_screen.dart';
import 'package:flutter_taxi/utils/routes/routes_name.dart';

import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
