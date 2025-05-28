import 'package:flutter/material.dart';
import 'package:paxride/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function? onSuffixIconPressed;
  final FocusNode? focusNode;
  final Widget? icon;

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.focusNode,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(AppColors.textColor1),
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon:
              suffixIcon != null
                  ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: () => onSuffixIconPressed?.call(),
                  )
                  : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
