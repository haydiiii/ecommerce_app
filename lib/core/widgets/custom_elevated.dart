import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final Function() onPressed;
  final TextStyle? textStyle;
  final Widget? child;

  const CustomElevatedButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.padding,
    this.shape,
    required this.onPressed,
    this.textStyle,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 55,
        width: width ?? 100,
        child: ElevatedButton(    
           
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primaryColor,
            padding: padding ?? const EdgeInsets.all(5),
            shape: shape ??
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: onPressed,
          child: child,
        ));
  }
}
