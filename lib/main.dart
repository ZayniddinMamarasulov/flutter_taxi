import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/utils/router.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/utils/colors.dart';
import 'package:flutter_taxi/utils/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'GB'),
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
      ],
      path: 'assets/translation',
      fallbackLocale: const Locale('ru','RU'),
      child: const MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
