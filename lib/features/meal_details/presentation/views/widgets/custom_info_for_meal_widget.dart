import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomInfoForMealWidget extends StatelessWidget {
  const CustomInfoForMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.HeightResponsive,
      padding: EdgeInsets.symmetric(
        horizontal: 8.WidthResponsive,
        vertical: 4.HeightResponsive,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(20.RadiusResponsive),
      ),
      child: Column(
        children: [
          Text(
            '100 k',
            style: AppTextStyles.BalooThambi2_400_12.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          Text(
            'Energy',
            style: AppTextStyles.BalooThambi2_700_12.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
