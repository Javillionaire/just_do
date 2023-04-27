import 'package:just_do/app_const/app_exports.dart';

abstract class Styles {
  static const String ml = 'MontserratLight';
  static const String mr = 'MontserratRegular';
  static const String ms = 'MontserratSemiBold';
  static TextStyle headline1 = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
      fontFamily: ms);
  static TextStyle headline3 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
      fontFamily: mr);
  static TextStyle headline3Light = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
      fontFamily: ml);
  static TextStyle headline2 = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      fontFamily: mr);
  static TextStyle headline2Semi = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      fontFamily: ms);
  static TextStyle headline2Light = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
      fontFamily: ml);
}
