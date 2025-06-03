import 'package:flutter/material.dart';
import 'package:paxride/constants/colors.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget widget;
  const BackgroundContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(color: Color(AppColors.backgroundColor)),
      child: widget,
    );
  }
}
