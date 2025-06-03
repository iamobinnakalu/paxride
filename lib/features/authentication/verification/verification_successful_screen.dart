import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/features/usertype/screen/usertype_screen.dart';
import 'package:paxride/widgets/custom_button.dart';
import 'package:paxride/widgets/custom_container.dart';

import '../../../constants/colors.dart';
class VerificationSuccessfulScreen extends StatefulWidget {
  const VerificationSuccessfulScreen({super.key});

  @override
  State<VerificationSuccessfulScreen> createState() => _VerificationSuccessfulScreenState();
}

class _VerificationSuccessfulScreenState extends State<VerificationSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.textColor1),
      appBar: AppBar(
        backgroundColor: Color(AppColors.textColor1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Color(AppColors.textColor2),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomContainer(
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
          child: Column(
            children: [
              Image.asset('assets/icons/successful.png'),

              SizedBox(height: 20.h),
              Text(
                'Awesome!',
                style: GoogleFonts.manrope(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(AppColors.textColor2),
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                'Your Paxride account is now fully verified. Jump in \n           and explore all features without limits.',
                style: GoogleFonts.urbanist(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColors.textColor2),
                ),
              ),
              SizedBox(height: 230.h),
              CustomButton(
                  text: 'Continue to Dashboard',
                  fontWeight: FontWeight.w500,
                  width: double.infinity,
                  textColor: Color(AppColors.textColor1),
                  onPressed: () {
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => UsertypeScreen()),
                    );
                  },
                  backgroundColor: Color(AppColors.textColor2),
                borderRadius: 10.r,
              )
            ],
          ),
        ),
      ),
    );
  }
}
