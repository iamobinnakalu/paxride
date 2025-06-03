import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/constants/colors.dart';
import 'package:paxride/widgets/custom_button.dart';
import 'package:paxride/widgets/custom_container.dart';
import 'package:paxride/widgets/custom_textfield.dart';

import '../signup_screen/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.backgroundColor),
      appBar: AppBar(
        backgroundColor: Color(AppColors.backgroundColor),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Color(AppColors.textColor1),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomContainer(
        widget: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in to Continue',
                  style: GoogleFonts.manrope(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Sign in to unlock seamless travel and mobility at your \nfingertips..',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Email address',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 6.h),
                CustomTextfield(
                  hintText: 'Email address',
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Password',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 6.h),
                CustomTextfield(
                  hintText: 'Email password',
                  prefixIcon: Icons.lock_outline_rounded,
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgotten password?',
                      style: GoogleFonts.urbanist(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(AppColors.textColor1),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                // CustomTextfield(
                //   hintText: 'Confirm password',
                //   prefixIcon: Icons.lock_outline_rounded,
                // ),
                // SizedBox(height: 14.h),
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment.start,
                //   // crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding:  EdgeInsets.only(left: 0.0.w),
                //       child: Transform.scale(
                //         scale: 1.3,
                //         child: Checkbox(
                //           // This is the checkbox Alignment
                //           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //           visualDensity: VisualDensity.compact,
                //
                //           checkColor: Color(AppColors.textColor1),
                //           value: isChecked,
                //           onChanged: (bool? value) {
                //             // Handle checkbox state change
                //             setState(() {
                //               isChecked = value ?? false;
                //             });
                //           },
                //           fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                //             return Colors.transparent;
                //           }),
                //           side: MaterialStateBorderSide.resolveWith((states) {
                //             if (states.contains(MaterialState.selected)) {
                //               return BorderSide(color: isChecked ? Color(AppColors.textColor1) : Color(AppColors.textColor1), width: 1.5);
                //             }
                //             return BorderSide(color: Color(AppColors.textColor1,));
                //           }),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(4.r),
                //           ),
                //         ),
                //       ),
                //     ),
                //     Flexible(
                //       child: RichText(
                //         text: TextSpan(
                //           style: GoogleFonts.urbanist(),
                //           children: [
                //             TextSpan(
                //                 text: 'By clicking on sign up, you agree to ',
                //                 style: GoogleFonts.urbanist(color: Color(AppColors.textColor1))),
                //             TextSpan(
                //               text: 'Paxride’s Terms & Conditions and Privacy practices.',
                //               style: GoogleFonts.urbanist(
                //                 fontWeight: FontWeight.w600,
                //                 color: Color(AppColors.textColor1),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 27.h),
                CustomButton(
                  text: 'Sign in',
                  width: MediaQuery.sizeOf(context).width,
                  textColor: Color(AppColors.textColor2),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //   MaterialPageRoute(builder: (context) => )
                    // );
                  },
                  backgroundColor: Color(AppColors.btn1),
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  width: MediaQuery.sizeOf(context).width,
                  icon: SizedBox(
                      height: 21.h,
                      width: 21.w,
                      child: Image.asset('assets/icons/google_icon.png')),
                  text: 'Sign in with Google',
                  textColor: Color(AppColors.textColor2),
                  onPressed: () {},
                  backgroundColor: Color(AppColors.textColor1),
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  width: MediaQuery.sizeOf(context).width,
                  icon: Image.asset('assets/icons/apple_icon.png'),
                  text: 'Sign in with Apple',
                  textColor: Color(AppColors.textColor2),
                  onPressed: () {},
                  backgroundColor: Color(AppColors.textColor1),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.urbanist(
                        fontSize: 14.sp,
                        color: Color(AppColors.textColor1),
                      ),
                    ),
                    SizedBox(width: 1.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          color: Color(AppColors.textColor1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
