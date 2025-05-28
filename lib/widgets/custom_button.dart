import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

// class CustomButton extends StatelessWidget {
//   final String label;
//   final Function onPressed;
//   final Color? color;
//
//   CustomButton({
//     required this.label,
//     required this.onPressed,
//     this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 54,
//       width: 355,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         onPressed: () => onPressed(),
//         child: Text(
//           label,
//           style: GoogleFonts.workSans(
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? height;
  final double? width;
  final double borderRadius;
  final FontWeight? fontWeight;
  final Widget? icon;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(AppColors.backgroundColor),
    this.textColor = const Color(AppColors.textColor1),
    this.height = 54.0,
    this.width = 355.0,
    this.borderRadius = 30.0,
    this.fontWeight = FontWeight.w500,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //This helps to align the icon and text inside the button properly
            if (icon != null) ...[
              icon!,
              SizedBox(width: 22.0),
            ],
            Text(
              text,
              style: GoogleFonts.workSans(
                fontSize: 18.sp,
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
