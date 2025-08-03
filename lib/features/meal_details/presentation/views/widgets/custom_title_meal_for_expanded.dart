import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTitleMealForExpanded extends StatelessWidget {
  const CustomTitleMealForExpanded({super.key, required this.strMeal});

  final String strMeal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 5.widthResponsive,
        bottom: 10.heightResponsive,
      ),
      child: Center(
        child: Text(
          strMeal,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.BalooThambi2_500_18.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
