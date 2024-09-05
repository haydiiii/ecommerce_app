import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/colors.dart';

class CustomTxtFField extends StatefulWidget {
  const CustomTxtFField({
    super.key,
    required this.text,
    required this.prefixicon,
    this.controller,
    this.suffixicon,
    this.obscuretext = false,
    this.onTapSuffixIcon,
    this.validator,
  });

  final String text;
  final IconData? suffixicon;
  final IconData prefixicon;
  final bool obscuretext;
  final VoidCallback? onTapSuffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  CustomTxtFFieldState createState() => CustomTxtFFieldState();
}

class CustomTxtFFieldState extends State<CustomTxtFField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscuretext;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 52,
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.prefixicon,
            color: AppColors.primaryColor,
          ),
          suffixIcon: widget.suffixicon != null
              ? IconButton(
                  icon: Icon(widget.suffixicon),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                      if (widget.onTapSuffixIcon != null) {
                        widget.onTapSuffixIcon!();
                      }
                    });
                  },
                )
              : null,
          hintText: widget.text,
          filled: true,
          fillColor: AppColors.greyColor.withOpacity(0.3),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
