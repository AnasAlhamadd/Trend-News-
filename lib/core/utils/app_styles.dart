import 'package:flutter/material.dart';
import 'package:untitled4/core/utils/app_color.dart';
import 'package:untitled4/core/utils/constant.dart';

class AppTextStyles {
  static const TextStyle style20 = TextStyle(
    fontFamily: kFontFamilyRobotoSlab,
    fontSize: 20,
    color: Colors.white,
  );

  static const TextStyle style26 = TextStyle(
    fontSize: 26,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w900,
    color: Colors.white,
    height: 1.5,
    fontFamily: kFontFamilyRobotoSlab,
  );
  static const TextStyle style30 = TextStyle(
    fontFamily: kFontFamilyRobotoSlab,
    fontSize: 30,
    color: Appcolor.kprimaryColor,

    fontWeight: FontWeight.w500, // Regular
  );

  static const TextStyle style15 = TextStyle(
    fontFamily: kFontFamilyMontserrat,
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
