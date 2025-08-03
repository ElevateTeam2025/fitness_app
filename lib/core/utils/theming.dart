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
      unselectedLabelStyle: AppTextStyles.balooThambi2_400_12,
      selectedLabelStyle: AppTextStyles.balooThambi2_400_12,
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
      hintStyle: AppTextStyles.balooThambi2_400_12.copyWith(
        color: const Color(0xffD3D3D3),
      ),
      labelStyle: AppTextStyles.balooThambi2_400_12.copyWith(
        color: const Color(0xffD3D3D3),
      ),
      contentPadding: EdgeInsetsDirectional.fromSTEB(
        (16 / ScreenSizeService.baseWidth) * screenWidth,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
        0,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.red),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.white),
      ),
      border: textFieldInputBorder(),
      filled: true,
      fillColor: Colors.transparent,
      errorMaxLines: 2,
      errorStyle: AppTextStyles.balooThambi2_400_12.copyWith(color: Colors.red),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyles.balooThambi2_600_16.copyWith(
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
  double responsiveRadius = 20.radiusResponsive;
  double responsiveBorderWidth = 1.borderResponsive;

  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(responsiveRadius)),
    borderSide: BorderSide(
      color: AppColors.greyColor,
      width: responsiveBorderWidth,
    ),
  );
}

OutlineInputBorder textFieldInputBorderFocus() {
  double responsiveRadius = 20.radiusResponsive;
  double responsiveBorderWidth = 1.borderResponsive;

  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(responsiveRadius)),
    borderSide: BorderSide(
      color: AppColors.greyColor,
      width: responsiveBorderWidth,
    ),
  );
}
