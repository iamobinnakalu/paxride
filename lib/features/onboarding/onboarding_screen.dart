import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/features/authentication/signup_screen/signup_screen.dart';
import 'package:paxride/widgets/custom_button.dart';
import '../../constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.backgroundColor),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 95.0).h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding1.png',
              width: double.infinity,
            ),
            SizedBox(height: 22.h),
            Text(
              ' Every journey starts   \nwith smarter choices.',
              style: GoogleFonts.manrope(
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                color: Color(AppColors.textColor1),
              ),
            ),
            SizedBox(height: 22),
            Text(
              'From everyday trips to long-term rentals, Paxride puts\n                          the power in your handes.',
              style: GoogleFonts.urbanist(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Color(AppColors.textColor1),
              ),
            ),
            SizedBox(height: 66.h),
            CustomButton(
                text: 'Get Started',
                fontWeight: FontWeight.w500,
                textColor: Color(AppColors.textColor2),
                backgroundColor: Color(AppColors.btn1),
                onPressed: () {
                  // Navigate to the next screen or perform an action
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
            ),
          ],
        ),
      ),
    );
  }
}
