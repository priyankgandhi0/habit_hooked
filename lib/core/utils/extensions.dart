
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

extension AddSpace on num {
  SizedBox spaceH() {
    return SizedBox(height: toDouble());
  }

  SizedBox spaceW() {
    return SizedBox(width: toDouble());
  }
}

extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var wom = 0;
    var date = this;

    while (date.month == month) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }
}

extension WidgetExt on Widget {
  Widget onTap(GestureTapCallback onTap) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: this,
    );
  }

  Widget onClick(GestureTapCallback onClick) {
    return GestureDetector(
      onTap: onClick,
      child: this,
    );
  }
}

extension AddText on String {
  Widget appTextStyle(
      {Color fontColor = blackTextColor,
      bool? opacity,
      double? fontSize,
      TextAlign textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.w500,
      TextOverflow? textOverflow,
      int? maxLines,
      TextDecoration? decoration,
      double? letterSpacing,
      String? fontFamily,
      FontStyle? fontStyle,
      List<Color>? gradientColors,
      Color? decorationColor}) {
    return Text(
      maxLines: maxLines,
      this,
      overflow: textOverflow,
      style: GoogleFonts.lato(
        fontSize: fontSize?.sp ?? 16.sp,
        color: (opacity ?? false) ? fontColor.withOpacity(0.5) : fontColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none,
        letterSpacing: letterSpacing ?? 0,
        decorationColor:
            (opacity ?? false) ? fontColor.withOpacity(0.5) : fontColor,
      ),
      textAlign: textAlign,
    );
  }
}




TextStyle getTextStyle(
    {Color fontColor = blackTextColor,
    bool? opacity,
    double? fontSize,
    TextAlign textAlign = TextAlign.center,
    FontWeight fontWeight = FontWeight.w500,
    TextOverflow? textOverflow,
    int? maxLines,
    TextDecoration? decoration,
    double? letterSpacing,
    String? fontFamily,
    FontStyle? fontStyle,
    Color? decorationColor}) {
  return TextStyle(
    fontSize: fontSize?.sp ?? 16.sp,
    color: (opacity ?? false) ? fontColor.withOpacity(0.5) : fontColor,
    fontWeight: fontWeight,
    fontStyle: fontStyle ?? FontStyle.normal,
    decoration: decoration ?? TextDecoration.none,
    letterSpacing: letterSpacing ?? 0,
    fontFamily: 'Switzer',
    decorationColor:
        (opacity ?? false) ? fontColor.withOpacity(0.5) : fontColor,
  );
}

bool isEmailValid(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(email);
}

