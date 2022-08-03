
import 'package:flutter/material.dart';

class TextFormFieldButton extends StatelessWidget {
  const TextFormFieldButton({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xff3E4958),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.visibility_off,
                color: Color(0xff97ADB6),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffD5DDE0), width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
