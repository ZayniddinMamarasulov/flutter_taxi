import 'package:flutter/material.dart';

Drawer drawer(Size size) {
  return Drawer(
    child: ListView(
      children: [
        CustomDrawerHeader(
          size: size,
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              'История поездок'.toUpperCase(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              'Сбособ Оплаты'.toUpperCase(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              'Промокод'.toUpperCase(),
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
                    offset: const Offset(-2, 2)
                  )
                ]
              ),
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
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              'Поддержка'.toUpperCase(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),
            ),
          ),
        ),
      ],
    ),
  );
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
      decoration: const BoxDecoration(color: Color(0xff7EAB3A)),
      child: Padding(
        padding: const EdgeInsets.only(left: 52, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/photo_user.png',
              ),
              backgroundColor: Colors.white,
              radius: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Егор',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
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
