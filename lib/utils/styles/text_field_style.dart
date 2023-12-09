import 'package:flutter/material.dart';

import '../app_colors.dart';


InputDecoration textFieldDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      color: AppColors.primaryHighContrast,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: AppColors.primaryDark,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: AppColors.primaryColor,
      ),
    ),
  );
}

textFieldTextStyle() {
  return TextStyle(
    color: AppColors.darkGrey,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}
