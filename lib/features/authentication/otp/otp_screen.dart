import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/features/authentication/verification/verification_successful_screen.dart';
import 'package:paxride/widgets/custom_container.dart';
import 'package:paxride/widgets/custom_textfield.dart';
import '../../../theme/colors.dart';
import '../../../widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColor1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.textColor2,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomContainer(
        backgroundColor: AppColors.textColor1,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 60.h),
          child: Column(
            children: [
              Image.asset(
                  'assets/icons/inbox.png',
                height: 150.h,
                width: 126.w,
              ),
              Text(
                'Almost there!',
                style: GoogleFonts.manrope(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(height: 12.h),
              Text('Please check your inbox and enter the verification \n                            code we just sent.',
                style: GoogleFonts.urbanist(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 5.w,
                children: List.generate(4, (index) {
                  return Container(
                    height: 57.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      color:AppColors.verifyColorFill,
                      borderRadius: BorderRadius.circular(10.r),
                    ),

                    alignment: Alignment.center,
                    child: Text(
                      '',
                      style: GoogleFonts.urbanist(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color:AppColors.textColor2,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 100.h),
              CustomButton(
                text: 'Verify now',
                fontWeight: FontWeight.w500,
                textColor: AppColors.textColor2,
                onPressed: () {
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => VerificationSuccessfulScreen()),                  );
                },
                backgroundColor:AppColors.btn1,
                borderRadius: 10.r,
                height: 57.h,
                width: double.infinity,
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: 'Resend Code',
                fontWeight: FontWeight.w500,
                textColor: AppColors.textColor2,
                onPressed: () {},
                backgroundColor: AppColors.textColor1,
                borderRadius: 10.r,
                height: 57.h,
                width: double.infinity,
                borderSide: BorderSide(color:AppColors.textColor2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
