import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paxride/common/widgets/bg_container.dart';
import '../../theme/colors.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;
  bool slideIn = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 7),
      vsync: this,
    );

    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();

    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) return;
      setState(() {
        slideIn = !slideIn;
      });
    });
    Timer(const Duration(seconds: 9), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: opacity,
                child: Image.asset(
                  'assets/images/Logo.png',
                  width: 300.w,
                  height: 300.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
