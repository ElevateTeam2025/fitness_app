import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';

class ExerciseHeader extends StatelessWidget {
  const ExerciseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: responsiveHeight(344),
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.logo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: responsiveHeight(344),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: responsiveHeight(30),
          left: responsiveWidth(16),
          right: responsiveWidth(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // temperately... will change when i get data from previous screen
                "Chest Exercise",
                style: AppTextStyles.BalooThambi2_600_18.copyWith(color: AppColors.whiteColor),
              ),
              SizedBox(height: responsiveHeight(8)),
              Text(
                "Lorem Ipsum Dolor Sit Amet Consectetur. Tempus Volutpat Ut Nisi Morbi.",
                style: AppTextStyles.BalooThambi2_400_14.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
