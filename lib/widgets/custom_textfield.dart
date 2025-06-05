import 'package:flutter/material.dart';
import 'package:paxride/theme/colors.dart';

import 'package:paxride/theme/typeface.dart';

// class CustomTextfield extends StatelessWidget {
//   final String hintText;
//   final TextEditingController? controller;
//   final bool obscureText;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final Function? onSuffixIconPressed;
//   final FocusNode? focusNode;
//   final Widget? icon;
//   final Color? fillColor;

//   const CustomTextfield({
//     super.key,
//     required this.hintText,
//     this.controller,
//     this.obscureText = false,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.onSuffixIconPressed,
//     this.focusNode,
//     this.icon,
//     this.fillColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width,
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: AppColors.textColor1,
//           //fillColor: fillColor ?? Color(AppColors.textColor1),
//           hintText: hintText,
//           prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//           suffixIcon:
//               suffixIcon != null
//                   ? IconButton(
//                     icon: Icon(suffixIcon),
//                     onPressed: () => onSuffixIconPressed?.call(),
//                   )
//                   : null,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//         ),
//       ),
//     );
//   }
// }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.initialValue,
    this.onSaved,
    this.labelText,
    this.prefixIcon,
  });
  final TextEditingController? controller;
  final String? initialValue;
  final String? labelText;
  final void Function(String?)? onSaved;
  final String hintText;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      initialValue: initialValue,

      cursorHeight: 25,
      // style: appstyle(
      //     16, Theme.of(context).colorScheme.secondary, FontWeight.w500),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: AppColors.textColor1,
        // fillColor: Theme.of(context).colorScheme.onPrimary,`
        suffixIconColor: const Color.fromARGB(255, 153, 152, 152),
        prefixIconColor: const Color.fromARGB(255, 153, 152, 152),
        filled: true,
        label: Text(
          labelText!,
          style: Typeface.small1.copyWith(
            color: ColorScheme.of(context).secondary.withOpacity(0.5),
          ),
        ),

        hintText: hintText,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 51, 51, 51)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        // hintStyle: appstyle(14, Colors.grey.shade400, FontWeight.w500),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 0.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.btn1, width: 0.1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 0.1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey, width: 0.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.orangeColor600, width: 0.5),
        ),
        // border: InputBorder.none
      ),
    );
  }
}
