import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/features/home/notification/notification_controller.dart';
import 'package:paxride/theme/colors.dart';
import 'package:paxride/widgets/custom_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = NotificationController();

    return CustomContainer(
      widget: Scaffold(
        backgroundColor: AppColors.textColor1,
        body: Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 100.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.verifyColorFill,
                      borderRadius: BorderRadius.circular(30.r)
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, size: 31.sp),
                      color: AppColors.textColor2,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 70.w),
                  Text(
                    'Notifications',
                    style: GoogleFonts.manrope(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  shrinkWrap: true,
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    final backgroundColor = index % 2 == 0
                        ? AppColors.btn1
                        : AppColors.verifyColorFill;
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: backgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: AppColors.textColor1,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Icon(
                              controller.getIconData(controller.notifications[index].icons),
                              size: 30.sp,
                              color: AppColors.btn1,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              controller.notifications[index].description,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.5.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
