import 'package:flutter/material.dart';
import 'package:flutter_taxi/router.dart';
import 'package:flutter_taxi/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      onGenerateRoute: MyRouter.generateRoute,
    );
  }

  void some(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
