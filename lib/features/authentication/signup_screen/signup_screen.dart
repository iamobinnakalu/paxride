import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/common/widgets/bg_container.dart';
import 'package:paxride/constants/colors.dart';
import 'package:paxride/widgets/custom_button.dart';
import 'package:paxride/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
      body: BackgroundContainer(
        widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an account',
                  style: GoogleFonts.manrope(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Start your journey with Paxride by entering your basic \ninformation.',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  'Email address',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 6),
                CustomTextfield(
                  hintText: 'Email address',
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 8),
                Text(
                  'Password',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 6),
                CustomTextfield(
                  hintText: 'Email password',
                  prefixIcon: Icons.lock_outline_rounded,
                ),
                SizedBox(height: 8),
                Text(
                  'Confirm password',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.textColor1),
                  ),
                ),
                SizedBox(height: 6),
                CustomTextfield(
                  hintText: 'Confirm password',
                  prefixIcon: Icons.lock_outline_rounded,
                ),
                SizedBox(height: 14),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          // This is the checkbox Alignment
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,

                          checkColor: Color(AppColors.textColor1),
                          value: isChecked,
                          onChanged: (bool? value) {
                            // Handle checkbox state change
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>((
                            states,
                          ) {
                            return Colors.transparent;
                          }),
                          side: MaterialStateBorderSide.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return BorderSide(
                                color:
                                    isChecked
                                        ? Color(AppColors.textColor1)
                                        : Color(AppColors.textColor1),
                                width: 1.5,
                              );
                            }
                            return BorderSide(
                              color: Color(AppColors.textColor1),
                            );
                          }),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.urbanist(),
                          children: [
                            TextSpan(
                              text: 'By clicking on sign up, you agree to ',
                              style: GoogleFonts.urbanist(
                                color: Color(AppColors.textColor1),
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Paxride’s Terms & Conditions and Privacy practices.',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                color: Color(AppColors.textColor1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 27),
                CustomButton(
                  text: 'Sign up',
                  width: MediaQuery.sizeOf(context).width,
                  textColor: Color(AppColors.textColor2),
                  onPressed: () {},
                  backgroundColor: Color(AppColors.btn1),
                ),
                SizedBox(height: 12),
                CustomButton(
                  width: MediaQuery.sizeOf(context).width,
                  icon: SizedBox(
                    height: 21,
                    width: 21,
                    child: Image.asset('assets/images/google_icon.png'),
                  ),
                  text: 'Sign up with Google',
                  textColor: Color(AppColors.textColor2),
                  onPressed: () {},
                  backgroundColor: Color(AppColors.textColor1),
                ),
                SizedBox(height: 12),
                CustomButton(
                  width: MediaQuery.sizeOf(context).width,
                  icon: Image.asset('assets/images/apple_icon.png'),
                  text: 'Sign up with Apple',
                  textColor: Color(AppColors.textColor2),
                  onPressed: () {},
                  backgroundColor: Color(AppColors.textColor1),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: GoogleFonts.urbanist(
                        fontSize: 14,
                        color: Color(AppColors.textColor1),
                      ),
                    ),
                    SizedBox(width: 1),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Login',
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
