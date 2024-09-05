import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

showCustomDialog(context, {required String message, Color? backgroundColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: getBodyStyle(color: AppColors.white),
      ),
      backgroundColor: backgroundColor ?? AppColors.pinkColor,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
}
