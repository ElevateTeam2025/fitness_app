import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class CustomInfoForMealWidget extends StatelessWidget {
  const CustomInfoForMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.heightResponsive,
      padding: EdgeInsets.symmetric(
        horizontal: 8.widthResponsive,
        vertical: 4.heightResponsive,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(20.radiusResponsive),
      ),
      child: Column(
        children: [
          Text(
            S.of(context).hondredK,
            style: AppTextStyles.balooThambi2_400_12.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          Text(
            S.of(context).energy,
            style: AppTextStyles.BalooThambi2_700_12.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
