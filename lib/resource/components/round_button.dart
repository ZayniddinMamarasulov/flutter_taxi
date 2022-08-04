import 'package:flutter/material.dart';
import 'package:flutter_taxi/resource/colors.dart';
import 'package:flutter_taxi/resource/fonts_style.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const RoundButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 303,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.deepGreenStyleColor,
        ),
        child: Center(
          child: Text(
            text,
            style: AppFonts.whiteHeadline2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
