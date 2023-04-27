import 'package:just_do/app_const/app_exports.dart';

enum AppTheme { lightTheme, darkTheme }

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
      brightness: Brightness.dark,
      cardColor: AppColors.whiteOpacity,
      textTheme: TextTheme(
          titleSmall: Styles.headline3Light,
          labelMedium: Styles.headline3,
          titleMedium: Styles.headline1,
          bodyMedium: Styles.headline2Semi.copyWith(color: AppColors.black)),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.white)),
  AppTheme.darkTheme: ThemeData(
      brightness: Brightness.light,
      cardColor: AppColors.blackOpacity,
      textTheme: TextTheme(
          titleSmall: Styles.headline3Light.copyWith(color: AppColors.white),
          labelMedium: Styles.headline3.copyWith(color: AppColors.white),
          bodyMedium: Styles.headline2Semi,
          titleMedium: Styles.headline1.copyWith(color: AppColors.white)),
      primaryColor: AppColors.darkPrimaryColor,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.black))
};
