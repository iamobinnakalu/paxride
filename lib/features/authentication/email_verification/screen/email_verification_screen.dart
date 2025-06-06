import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/features/authentication/otp/otp_screen.dart';
import 'package:paxride/widgets/custom_button.dart';
import 'package:paxride/widgets/custom_container.dart';
import 'package:paxride/widgets/custom_textfield.dart';
import '../../../../theme/colors.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
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
          padding: EdgeInsets.symmetric(horizontal: 15.0.h),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Email Address',
                  style: GoogleFonts.manrope(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.sp,
                  ),
                ),
                Text(
                  'Input your email to begin verifying your Paxride account.',
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Enter email address',
                  style: GoogleFonts.urbanist(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 0.h),
                CustomTextField(
                  controller: email,
                  hintText: "",
                  labelText: "Email address",
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: SizedBox.shrink(),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains("@")) {
                      return "Please enter a valid emailAddress";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 300.h),
                CustomButton(
                  text: 'Send OTP',
                  textColor: AppColors.textColor2,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OTPScreen()),
                    );
                  },
                  backgroundColor: AppColors.btn1,
                  borderRadius: 5.r,
                  height: 57.h,
                  width: double.infinity,
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: 'Create an account',
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.textColor2,
                  onPressed: () {},
                  backgroundColor: AppColors.textColor1,
                  borderRadius: 10.r,
                  height: 57.h,
                  width: double.infinity,
                  borderSide: BorderSide(color: AppColors.textColor2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
