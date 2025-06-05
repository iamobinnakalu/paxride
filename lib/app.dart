import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paxride/features/splashscreen/splash_screen.dart';
import 'package:paxride/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, themeProvider, Widget? child) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder:
              (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeProvider.themeData,

                home: SplashScreen(),
              ),
        );
      },
    );
  }
}
