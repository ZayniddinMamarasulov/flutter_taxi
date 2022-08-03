import 'package:flutter/material.dart';

import '../colors.dart';
import '../fonts_style.dart';

class TextFieldFormWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Function(String)? onFieldSubmitted;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool suffixIcon;

  const TextFieldFormWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.onFieldSubmitted,
    required this.keyboardType,
    required this.obscureText,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0, bottom: 8),
            child: Text(title, style: AppFonts.headline3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: SizedBox(
              height: 44,
              width: 303,
              child: TextFormField(
                obscureText: obscureText,
                onFieldSubmitted:   onFieldSubmitted,
                controller: controller,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  suffixIcon: suffixIcon == true
                      ? const Icon(
                          Icons.visibility_off,
                          size: 18,
                          color: AppColors.grey2StyleColor,
                        )
                      : null,
                  fillColor: AppColors.grey3StyleColor,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.greyStyleColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.greyStyleColor,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
