import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 34),
          const Icon(
            Icons.expand_more_rounded,
            size: 40,
            color: Color(0xffD5DDE0),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              children: const [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Image(
                        height: 80,
                        width: 80,
                        image: AssetImage("assets/photo_user.png"),
                        fit: BoxFit.cover,
                      ),
                    )),
                Align(
                  alignment: Alignment(1, -0.8),
                  child: Image(
                    width: 45,
                    height: 45,
                    image: AssetImage(
                      "assets/ic_edit.png",
                    ),
                  ),
                )
              ],
            ),
          ),
          const Text(
            'Егор',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff4B545A)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Udalovea@yandex.ru',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xff97ADB6)),
          ),
          const SizedBox(height: 60),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    buildOption(
                        'assets/ic_history.png', "История", 4, 4, context),
                    buildOption('assets/ic_payment.png', "Способ оплаты", -4, 4,
                        context),
                  ],
                ),
                Row(
                  children: [
                    buildOption(
                        'assets/ic_promo.png', "Промокод", 4, -4, context),
                    buildOption(
                        'assets/ic_support.png', "Поддержка", -4, -4, context),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                height: 65,
                width: 65,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                        offset: Offset(0, 0),
                        spreadRadius: 6,
                        blurRadius: 10,
                      )
                    ]),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption(image, title, double offsetX, double offsetY, con) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(con).size.width * 0.41,
      height: 146,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(offsetX, offsetY),
            spreadRadius: 6,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 36, width: 36),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff3E4958),
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
