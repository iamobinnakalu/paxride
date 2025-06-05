import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/common/widgets/bg_container.dart';
import 'package:paxride/provider/signUpNotifier.dart';
import 'package:paxride/theme/colors.dart';
import 'package:paxride/features/authentication/email_verification/screen/email_verification_screen.dart';
import 'package:paxride/widgets/custom_button.dart';
import 'package:paxride/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../signin_screen/signin_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.textColor1,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BackgroundContainer(
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
                        'Create an account',
                        style: GoogleFonts.manrope(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Start your journey with Paxride by entering your basic \ninformation.',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Email address',
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 6),
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

                      SizedBox(height: 8),
                      Text(
                        'Password',
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 6),

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
                      SizedBox(height: 8),
                      Text(
                        'Confirm password',
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor1,
                        ),
                      ),
                      SizedBox(height: 6),
                      CustomTextField(
                        controller: confirmPassword,
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

                                checkColor: AppColors.textColor1,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  // Handle checkbox state change
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>((
                                      states,
                                    ) {
                                      return Colors.transparent;
                                    }),
                                side: MaterialStateBorderSide.resolveWith((
                                  states,
                                ) {
                                  if (states.contains(MaterialState.selected)) {
                                    return BorderSide(
                                      color:
                                          isChecked
                                              ? AppColors.textColor1
                                              : AppColors.textColor1,
                                      width: 1.5,
                                    );
                                  }
                                  return BorderSide(
                                    color: AppColors.textColor1,
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
                                    text:
                                        'By clicking on sign up, you agree to ',
                                    style: GoogleFonts.urbanist(
                                      color: AppColors.textColor1,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Paxride’s Terms & Conditions and Privacy practices.',
                                    style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textColor1,
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
                          //   context,
                          //   MaterialPageRoute(
                          //     builder:
                          //         (context) => const EmailVerificationScreen(),
                          //   ),
                          // );
                        },
                        backgroundColor: AppColors.btn1,
                      ),
                      SizedBox(height: 12),
                      CustomButton(
                        width: MediaQuery.sizeOf(context).width,
                        icon: SizedBox(
                          height: 21,
                          width: 21,
                          child: Image.asset('assets/icons/google_icon.png'),
                        ),
                        text: 'Sign up with Google',
                        textColor: AppColors.textColor2,
                        onPressed: () {},
                        backgroundColor: AppColors.textColor1,
                      ),
                      SizedBox(height: 12),
                      CustomButton(
                        width: MediaQuery.sizeOf(context).width,
                        icon: Image.asset('assets/icons/apple_icon.png'),
                        text: 'Sign up with Apple',
                        textColor: AppColors.textColor2,
                        onPressed: () {},
                        backgroundColor: AppColors.textColor1,
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: AppColors.textColor1,
                            ),
                          ),
                          SizedBox(width: 1),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Login',
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
