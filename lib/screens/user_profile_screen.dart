import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/home_screen.dart';
import 'package:flutter_taxi/widgets/rounded_button.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(4),
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 2)),
                  ],
                ),
                child: const Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            buildUserInfo(size),
            SizedBox(
              height: size.height * 0.02,
            ),
            ListTile(
              title: const Text(
                'Уведомления',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xff3E4958),
                ),
              ),
              subtitle: const Text(
                'Для получения сообщений',
                style: TextStyle(
                  color: Color(0xff97ADB6),
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              trailing: CupertinoSwitch(
                value: value,
                onChanged: (newValue){
                  setState(() {
                    value = newValue;
                  });
                },
                activeColor: const Color(0xff7EAB3A),
              ),
            ),
            RoundedButton(title: 'Удалить аккаунт', page: HomeScreen(),),
          ],
        ),
      ),
    );
  }

  Column buildUserInfo(Size size) {
    return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/photo_user.png',
                ),
                backgroundColor: Colors.white,
                radius: 40,
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                'Егор',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958),
                ),
              ),
              Container(
                height: size.height * 0.3,
                margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 21),
                padding: const EdgeInsets.only(left: 15, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundColor: Color(0xffD5DDE0),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '+7 953 508 40 05',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff3E4958),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 2,
                      indent: 70,
                      color: Color(0xffD5DDE0),
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundColor: Color(0xffD5DDE0),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.mail_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'udalovea@yandex.ru',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff3E4958),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 2,
                      indent: 70,
                      color: Color(0xffD5DDE0),
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.facebook,
                            color: Color(0xffD5DDE0),
                            size: 42,
                          ),
                        ),
                        Text(
                          '@udalovdsgn',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff3E4958),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
