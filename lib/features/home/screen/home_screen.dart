import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paxride/theme/colors.dart';
import 'package:paxride/widgets/custom_container.dart';
import 'package:paxride/widgets/custom_textfield.dart';

import '../notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      widget: Scaffold(
        backgroundColor: AppColors.textColor1,
        body: Padding(
          padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w, top: 80.0.h),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/driver.png'),
                          radius: 20,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: GoogleFonts.manrope(
                              fontSize: 12.sp,
                              color: AppColors.textColor2,
                            ),
                          ),
                          Text(
                            'Nicholas A. Daramola',
                            style: GoogleFonts.manrope(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColor2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 90.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: AppColors.btn1,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.notifications),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CustomTextField(
                  borderRadius: 100.r,
                    borderSide: BorderSide.none,
                    hintText: "",
                    labelText: 'Search for trending cars',
                    filledColor: AppColors.verifyColorFill,
                    keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.btn1,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.filter_list, color: AppColors.textColor2),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.w),
                              decoration: BoxDecoration(
                                color: AppColors.btn1,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset('assets/icons/toyota_icon.png'),
                            ),
                          ],
                        ),
                      );
                    },
                ),
              ),
              SizedBox(height: 0.h),
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, -15.h),
                  child: Container(
                    width: double.infinity,
                    //height: 412.h,
                    decoration: BoxDecoration(
                      color: AppColors.verifyColorFill,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Most Popular Cars',
                                style: GoogleFonts.manrope(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textColor2,
                                  letterSpacing: -1.sp,
                                ),
                              ),
                              Text(
                                'View All',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.h),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0.h),
                              child: GridView.builder(
                                itemCount: 10,
                                  //shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 11.w,
                                    childAspectRatio: 1.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Transform.translate(
                                      offset: Offset(0, -30.h),
                                      child: Stack(
                                        children: [
                                          Icon(Icons.favorite, size: 30.sp, color: AppColors.btn1),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10.r),
                                            child: Image.asset(
                                              'assets/images/driver.png',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                          Positioned(
                                            top: 10.h,
                                              left: 10.w,
                                              child: Container(
                                                height: 25.h,
                                                width: 25.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.textColor1
                                                ),
                                                child: Icon(Icons.favorite, size: 20,),
                                              ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
