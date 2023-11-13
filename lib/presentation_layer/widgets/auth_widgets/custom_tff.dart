import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class CustomTFF extends StatelessWidget {
  final String hintText;

  const CustomTFF({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder borderStyle = const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.myAccentColor,
      ),
    );
    return TextFormField(
      cursorColor: AppColors.myAccentColor,
      style: const TextStyle(
        color: AppColors.myAccentColor,
        fontSize: 16,
        fontFamily: 'Nunito',
      ),
      keyboardType: TextInputType.emailAddress,
      enableSuggestions: true,
      decoration: InputDecoration(
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Nunito',
          color: AppColors.myAccentColor.withOpacity(0.8),
          fontSize: 14,
        ),
      ),
    );
  }
}
