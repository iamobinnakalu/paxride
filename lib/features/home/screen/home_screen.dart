import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, __) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/avatar.jpg'),
                          radius: 20,
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome", style: GoogleFonts.urbanist(fontSize: 12.sp, color: Colors.grey)),
                            Text("Nicholas A. Daramola", style: GoogleFonts.manrope(fontSize: 14.sp, fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.qr_code_scanner, color: Colors.black),
                    )
                  ],
                ),

                SizedBox(height: 20.h),

                /// Search Bar
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search for trending cars',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Icon(Icons.filter_alt_outlined, color: Colors.black),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                /// Horizontal Icon List
                SizedBox(
                  height: 50.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    separatorBuilder: (_, __) => SizedBox(width: 10.w),
                    itemBuilder: (_, index) {
                      return Container(
                        width: 50.h,
                        height: 50.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.directions_car_filled,
                            color: Colors.black,
                            size: 24.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                /// Most Popular Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Most Popular Cars", style: GoogleFonts.manrope(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    Text("View All", style: GoogleFonts.manrope(fontSize: 14.sp, color: Colors.grey)),
                  ],
                ),

                SizedBox(height: 10.h),

                /// Car Grid
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 16.h),
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              'assets/images/car${index % 6 + 1}.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(6.w),
                              child: const Icon(Icons.favorite_border, size: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
