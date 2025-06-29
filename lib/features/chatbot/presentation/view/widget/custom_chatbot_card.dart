import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomChatbotCard extends StatelessWidget {
  const CustomChatbotCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.HeightResponsive,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.WidthResponsive,
        vertical: 30.HeightResponsive,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerBg.withOpacity(.4),
        borderRadius: BorderRadius.circular(50.RadiusResponsive),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "How Can I Assist You\nToday ?",
            textAlign: TextAlign.center,
            style: AppTextStyles.BalooThambi2_600_24.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8.HeightResponsive),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Get Started",
              style: AppTextStyles.BalooThambi2_800_14.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
