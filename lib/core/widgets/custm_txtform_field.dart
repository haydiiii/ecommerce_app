import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/colors.dart';

class CustomTxtFField extends StatefulWidget {
  const CustomTxtFField({
    super.key,
    required this.text,
    required this.prefixicon,
    this.controller,
    this.suffixicon,
    this.obscuretext = false, // Default to false for regular text fields
    this.onTapSuffixIcon, this.validator,
  });

  final String text;
  final IconData? suffixicon;
  final IconData prefixicon;
  final bool obscuretext;
  final VoidCallback? onTapSuffixIcon;
  final TextEditingController? controller; 
  final String? Function(String?)? validator ; // Add the controller property

  @override
  // ignore: library_private_types_in_public_api
  _CustomTxtFFieldState createState() => _CustomTxtFFieldState();
}

class _CustomTxtFFieldState extends State<CustomTxtFField> {
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
        controller: widget.controller, // Use the controller
        obscureText: obscureText,
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
