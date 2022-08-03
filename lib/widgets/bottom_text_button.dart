
import 'package:flutter/material.dart';

class BottomTextButton extends StatelessWidget {
  const BottomTextButton({
    Key? key, required this.title, required this.buttonTitle, required this.page,
  }) : super(key: key);

  final String title;
  final String buttonTitle;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xff97ADB6)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){return page;}));
          },
          child: Text(
            buttonTitle,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xff7EAB3A),
            ),
          ),
        ),
      ],
    );
  }
}
