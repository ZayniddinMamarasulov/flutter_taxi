import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/register_screen.dart';
import 'package:flutter_taxi/screens/user_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Drawer drawer(Size size,BuildContext context) {
  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDrawerHeader(
          size: size,
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
          child: ListTile(
            title: Text(
              "travel_history".tr().toUpperCase(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
          child: ListTile(
            title: Text(
              "payment_method".tr().toUpperCase(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
          child: ListTile(
            title: Text(
              'promo_code'.tr().toUpperCase(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.50),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(-2, 2))
                  ]),
              child: const Text(
                '1',
                style: TextStyle(
                  color: Color(0xff3E4958),
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
          child: ListTile(
            title: Text(
              'support'.tr().toUpperCase(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding:  EdgeInsets.only(top: size.height * 0.05,bottom: size.height * 0.05,left: 15,),
          child: TextButton(
            onPressed: () {
              logOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return const RegisterScreen();
              }));
            },
            child: Text(
              'log_out'.tr(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xff7EAB3A),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

void logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLogin', false);
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 260 / 813,
      width: double.maxFinite,
      decoration: const BoxDecoration(color: Color(0xff7EAB3A)),
      child: Padding(
        padding: const EdgeInsets.only(left: 52, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserProfileScreen();
                }));
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/photo_user.png',
                ),
                backgroundColor: Colors.white,
                radius: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Егор',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Udalovea@yandex.ru',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
