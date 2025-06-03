import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  final Color? backgroundColor;

  const CustomContainer({super.key,
    required this.widget,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      //decoration: BoxDecoration(color: Color(AppColors.backgroundColor)),
      decoration: backgroundColor != null
          ? BoxDecoration(color: backgroundColor)
          : null,
      //color: backgroundColor ?? Color(AppColors.backgroundColor),
      child: widget,
    );
  }

}