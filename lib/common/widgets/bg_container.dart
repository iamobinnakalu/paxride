import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget widget;
  const BackgroundContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(color: ColorScheme.of(context).surface),
      child: widget,
    );
  }
}
