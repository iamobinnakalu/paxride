import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Typeface {
  late BuildContext context;
  // Base style
  static final base = GoogleFonts.urbanist(
    // color: Palette.grey700,
    fontSize: 14,
    height: 1.5,
  );

  // Headline styles
  static final headline1 = base.copyWith(
      fontSize: 35, // 44
      // color: Palette.grey700,
      height: 1.3,
      fontWeight: FontWeight.w700);

  static final headline2 = headline1.copyWith(
    fontSize: 30, // 32
    fontWeight: FontWeight.w600,
  );

  static final headline3 = base.copyWith(
    // color: Palette.background300,
    fontSize: 27, // 28
    fontWeight: FontWeight.w700,
  );

  static final headline4 = base.copyWith(
    // color: Palette.background300,
    fontSize: 16, // 24
    fontWeight: FontWeight.w500,
  );

  static final headline5 = base.copyWith(
    fontSize: 24, // 20
    fontWeight: FontWeight.w600,
  );

  static final headline6 = base.copyWith(
    // color: Colors.black,
    fontSize: 14, // 20
    fontWeight: FontWeight.w500,
  );

  static final leading1 = base.copyWith(
    fontSize: 14, // 20
    fontWeight: FontWeight.w700,
  );

  // Leading styles
  // static final leading1 = base.copyWith(fontSize: 14);
  static final leading2 = base.copyWith(
    // overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static final leading3 = base.copyWith(
    // overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  // static final leading1Light = leading1.copyWith(color: Palette.grey25);
  // static final leading2Light = leading2.copyWith(color: Palette.grey25);

  // Body styles
  static final body1 = base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static final body2 = base.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 21,
  );

  static final bodyTab2 = base.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 22.sp,
  );

  static final body3 = base.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );

  static final body4 = base.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  // static final body1Light = body1.copyWith(color: Palette.primary900);
  static final body2Light = base.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  // Small text styles
  static final small1 = base.copyWith(
      // color: Theme.of(BuildContext as BuildContext).colorScheme.secondary,
      fontWeight: FontWeight.w700,
      fontSize: 14);

  static final small2 = small1.copyWith(
      color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16);

  static final small3 =
      small1.copyWith(fontWeight: FontWeight.w800, fontSize: 16);

  static final small4 =
      small1.copyWith(fontWeight: FontWeight.w700, fontSize: 12);

  static final small5 = small1.copyWith(
      color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10);

  static final small6 =
      small1.copyWith(fontWeight: FontWeight.w500, fontSize: 18);

  static final small7 = small1.copyWith(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18);

  static final small8 =
      small1.copyWith(fontWeight: FontWeight.w400, fontSize: 12);
}
