import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  final screenWidth = ScreenSizeService.width;
  final screenHeight = ScreenSizeService.height;

  return ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFF242424).withOpacity(0.80),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedLabelStyle: AppTextStyles.BalooThambi2_400_12,
      selectedLabelStyle: AppTextStyles.BalooThambi2_400_12,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffFF4100),
        minimumSize: Size(
          (311 / ScreenSizeService.baseWidth) * screenWidth,
          (38 / ScreenSizeService.baseHeight) * screenHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.20),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,          // <-- your cursor color
      selectionColor: AppColors.primaryColor.withOpacity(0.3),
      selectionHandleColor: AppColors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: AppTextStyles.BalooThambi2_400_12.copyWith(
        color: const Color(0xffD3D3D3),
      ),
      labelStyle: AppTextStyles.BalooThambi2_400_12.copyWith(
        color: const Color(0xffD3D3D3),
      ),
      contentPadding: EdgeInsetsDirectional.fromSTEB(
        (16 / ScreenSizeService.baseWidth) * screenWidth,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
        0,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
      ),
      focusedBorder: textFieldInputBorderFocus(),
      enabledBorder: textFieldInputBorder(),
      border: textFieldInputBorder(),
      filled: true,
      fillColor: Colors.transparent,
      errorMaxLines: 2,
      errorStyle: AppTextStyles.BalooThambi2_400_12.copyWith(color: Colors.red),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyles.BalooThambi2_600_16.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryColor,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
      // circularTrackColor: AppColors.greyColor
    ),
  );
}

OutlineInputBorder textFieldInputBorder() {
  final screenWidth = ScreenSizeService.width;
  double responsiveRadius = 20.RadiusResponsive;
  double responsiveBorderWidth = 1.BorderResponsive;

  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(responsiveRadius)),
    borderSide: BorderSide(
      color: AppColors.greyColor,
      width: responsiveBorderWidth,
    ),
  );
}

OutlineInputBorder textFieldInputBorderFocus() {
  double responsiveRadius = 20.RadiusResponsive;
  double responsiveBorderWidth = 1.BorderResponsive;

  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(responsiveRadius)),
    borderSide: BorderSide(
      color: AppColors.greyColor,
      width: responsiveBorderWidth,
    ),
  );
}
