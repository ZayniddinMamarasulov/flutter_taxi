import 'package:flutter/material.dart';
import 'package:flutter_taxi/utils/router.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/utils/colors.dart';
import 'package:flutter_taxi/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
        backgroundColor: backgroundColor,
      ),
      initialRoute: routeSplash,
      onGenerateRoute: MyRouter.generateRoute,

    );
  }

  void some(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
