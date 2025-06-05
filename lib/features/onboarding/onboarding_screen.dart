import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/common/widgets/bg_container.dart';
import 'package:paxride/features/authentication/signup_screen/signup_screen.dart';
import 'package:paxride/widgets/custom_button.dart';
import '../../theme/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        widget: Column(
          spacing: 30,
          children: [
            SizedBox(
              child: Image.asset(
                fit: BoxFit.fill,
                width: double.infinity,
                'assets/images/onboarding1.png',
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 30.h,
                children: [
                  Text(
                    ' Every journey starts   \nwith smarter choices.',
                    style: GoogleFonts.manrope(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textColor1,
                    ),
                  ),

                  Text(
                    'From everyday trips to long-term rentals, Paxride puts the power in your handes.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor1,
                    ),
                  ),
                  CustomButton(
                    text: 'Get Started',
                    width: MediaQuery.sizeOf(context).width,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.textColor2,
                    backgroundColor: AppColors.btn1,
                    onPressed: () {
                      // Navigate to the next screen or perform an action
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
