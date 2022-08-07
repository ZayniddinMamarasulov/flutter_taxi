import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/profile_screen.dart';

import '../utils/colors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 54),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 25, left: 51, bottom: 25),
                      child: const Text(
                        "История поездок",
                        style: TextStyle(
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
                      padding:
                          const EdgeInsets.only(top: 25, left: 51, bottom: 25),
                      child: const Text(
                        "Сбособ Оплаты",
                        style: TextStyle(
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
                          top: 25, left: 51, bottom: 25, right: 34),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Промокод",
                            style: TextStyle(
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
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 25, left: 51, bottom: 25),
                      child: const Text(
                        "Поддержка",
                        style: TextStyle(
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
                padding: const EdgeInsets.only(left: 52, bottom: 68),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Выйти",
                    style: TextStyle(
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
}
