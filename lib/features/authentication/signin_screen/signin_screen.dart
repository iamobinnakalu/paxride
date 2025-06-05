import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/provider/signUpNotifier.dart';
import 'package:paxride/theme/colors.dart';
import 'package:paxride/widgets/custom_button.dart';
import 'package:paxride/widgets/custom_container.dart';
import 'package:paxride/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../signup_screen/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.textColor1,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomContainer(
        widget: Consumer<SignUpNotifier>(
          builder: (BuildContext context, signUpNotifier, Widget? child) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 0.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in to Continue',
                        style: GoogleFonts.manrope(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Sign in to unlock seamless travel and mobility at your \nfingertips..',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'Email address',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 6.h),
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
                      SizedBox(height: 10.h),
                      Text(
                        'Password',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      CustomTextField(
                        controller: password,
                        labelText: "Password",
                        hintText: "",
                        obscureText: signUpNotifier.obscureText,
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            signUpNotifier.obscureText =
                                !signUpNotifier.obscureText;
                          },
                          child: Icon(
                            signUpNotifier.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator:
                            (value) =>
                                value!.length < 6
                                    ? "Password must be at least 6 characters"
                                    : null,
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
                              color: AppColors.textColor1,
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
                        textColor: AppColors.textColor2,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // showLoadingDialog(context, "Login in..");

                            // _checkVerification();

                            // Trigger the login process
                            // await loginProvider.login(
                            //   context,
                            //   email.text,
                            //   password.text,
                            // );

                            Navigator.pop(context);
                          } else {
                            print('Form is not valid');
                          }
                          // Navigator.push(
                          //     context,
                          //   MaterialPageRoute(builder: (context) => )
                          // );
                        },
                        backgroundColor: AppColors.btn1,
                      ),
                      SizedBox(height: 12.h),
                      CustomButton(
                        width: MediaQuery.sizeOf(context).width,
                        icon: SizedBox(
                          height: 21.h,
                          width: 21.w,
                          child: Image.asset('assets/icons/google_icon.png'),
                        ),
                        text: 'Sign in with Google',
                        textColor: AppColors.textColor2,
                        onPressed: () {},
                        backgroundColor: AppColors.textColor1,
                      ),
                      SizedBox(height: 12.h),
                      CustomButton(
                        width: MediaQuery.sizeOf(context).width,
                        icon: Image.asset('assets/icons/apple_icon.png'),
                        text: 'Sign in with Apple',
                        textColor: AppColors.textColor2,
                        onPressed: () {},
                        backgroundColor: AppColors.textColor1,
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.urbanist(
                              fontSize: 14.sp,
                              color: AppColors.textColor1,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
