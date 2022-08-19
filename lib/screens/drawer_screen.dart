import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/profile_screen.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';
import 'package:flutter_taxi/utils/colors.dart';
import 'package:flutter_taxi/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 312,
          width: double.infinity,
          color: drawerHeaderBackgroundColor,
          padding: const EdgeInsets.only(left: 52, top: 90),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    buildBottomSheet(context);
                  },
                  child: const Image(
                    height: 80,
                    width: 80,
                    image: AssetImage("assets/photo_user.png"),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Егор',
                  style: TextStyle(
                    color: drawerHeaderUsernameColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Udalovea@yandex.ru',
                  style: TextStyle(
                    color: drawerHeaderUsernameColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 20, left: 40, bottom: 20),
                        child: Text(
                          stringTravelHistory.tr(),
                          style: const TextStyle(
                            color: Color(0xff3E4958),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 20, left: 40, bottom: 20),
                        child: Text(
                          stringPaymentMethod.tr(),
                          style: const TextStyle(
                            color: Color(0xff3E4958),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 20, left: 40, bottom: 20, right: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              stringPromocode.tr(),
                              style: const TextStyle(
                                color: Color(0xff3E4958),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(0, 3),
                                      spreadRadius: 2.5,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3E4958)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _bottomSheet(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 20, left: 40, bottom: 20),
                        child: Text(
                          stringlang.tr(),
                          style: const TextStyle(
                            color: Color(0xff3E4958),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 20, left: 40, bottom: 20),
                        child: Text(
                          stringSupport.tr(),
                          style: const TextStyle(
                            color: Color(0xff3E4958),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 30),
                  child: GestureDetector(
                    onTap: () {
                      unSaveLogin();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                          (route) => false);
                    },
                    child: Text(
                      stringLogOut.tr(),
                      style: const TextStyle(
                        color: Color(0xff7EAB3A),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: MediaQuery.of(context).size.height,
        ),
        backgroundColor: backgroundColor,
        barrierColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const FractionallySizedBox(
            heightFactor: 1,
            child: ProfileScreen(),
          );
        });
  }

  void unSaveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogIn', false);
  }

  _bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
          minHeight: MediaQuery.of(context).size.height * 0,
        ),
        backgroundColor: const Color(0xf07EAB3A),
        barrierColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      context.setLocale(const Locale('en', 'GB'));
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    stringlangEnGB.tr(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale('en', 'US'));
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      stringlangEnUS.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale('ru', 'RU'));
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      stringlangRu.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale('uz', 'UZ'));
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      stringlangUsb.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          );
        });
  }
}
