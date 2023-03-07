import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static final AppStyles _singleton = AppStyles._internal();
  AppStyles._internal();
  static AppStyles get instance => _singleton;

  final TextStyle? loginHeader = GoogleFonts.poppins(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 25.sp,
      color: Colors.black);

  final TextStyle? signUpHeader = GoogleFonts.poppins(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 18.sp,
      color: Colors.black);

  final TextStyle? homePageHeader = GoogleFonts.poppins(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 24.sp,
      color: Colors.black);

  final TextStyle? sAddressDetails = GoogleFonts.poppins(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
      color: Colors.black);
}
