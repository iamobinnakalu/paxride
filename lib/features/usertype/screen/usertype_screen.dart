import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/features/home/screen/home_screen.dart';
import 'package:paxride/features/usertype/controller/usertype_controller.dart';
import 'package:paxride/features/usertype/model/usertype_model.dart';
import 'package:paxride/widgets/custom_button.dart';
import 'package:paxride/widgets/custom_container.dart';
import '../../../theme/colors.dart';
import '../../authentication/verification/verification_successful_screen.dart';

class UsertypeScreen extends StatefulWidget {
  const UsertypeScreen({super.key});

  @override
  State<UsertypeScreen> createState() => _UsertypeScreenState();
}

class _UsertypeScreenState extends State<UsertypeScreen> {
  final UserTypeController controller = UserTypeController();

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
        widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose How You Want \nto Use Paxride',
                  style: GoogleFonts.manrope(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textColor2,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Choose your role so we can match you with the \nright tools.',
                  style: GoogleFonts.urbanist(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.insideText,
                  ),
                ),
                SizedBox(height: 10.h),
                ListView.builder(
                  itemCount: controller.userTypes.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final userType = controller.userTypes[index];
                    final isSelected = userType.isSelected;

                    final Color containerColor =
                        isSelected ? AppColors.textColor2 : AppColors.btn1;
                    final Color textColor =
                        isSelected
                            ? AppColors.textColor1
                            : AppColors.textColor2;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle the selection state
                          controller.toggleSelection(index);
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Container(
                          height: 131.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: containerColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(
                              spacing: 10.w,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    controller.userTypes[index].image,
                                    height: 110.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                    ),
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          spacing: 100.w,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.userTypes[index].title,
                                              style: GoogleFonts.manrope(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w700,
                                                color: textColor,
                                              ),
                                            ),
                                            Transform.scale(
                                              scale: 2.r,
                                              child: Checkbox(
                                                value: isSelected,
                                                onChanged: (_) {
                                                  setState(() {
                                                    controller.toggleSelection(
                                                      index,
                                                    );
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        10.r,
                                                      ),
                                                ),
                                                fillColor:
                                                    MaterialStateProperty.all(
                                                      AppColors.verifyColorFill,
                                                    ),
                                                checkColor:
                                                    isSelected
                                                        ? AppColors
                                                            .textColor2 //check box mark when selected
                                                        : AppColors
                                                            .verifyColorFill, //check box fill color when not selected
                                                side: BorderSide.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 0.h),
                                        Text(
                                          controller
                                              .userTypes[index]
                                              .description,
                                          style: GoogleFonts.urbanist(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                CustomButton(
                  text: 'Continue to Dashboard',
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.textColor1,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  backgroundColor: AppColors.textColor2,
                  borderRadius: 10.r,
                  height: 57.h,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
