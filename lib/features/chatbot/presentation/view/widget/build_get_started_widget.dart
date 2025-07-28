

import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class BuildGetStartedWidget  extends StatelessWidget {
  const BuildGetStartedWidget ({required this.onGetStarted,super.key});
  final VoidCallback onGetStarted;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(ImageAssets.chatbotImage),
            SizedBox(height: 30.HeightResponsive),
            Container(
              height: 160.HeightResponsive,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 16.WidthResponsive,
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
                  ElevatedButton(
                    onPressed: () {
                     onGetStarted();
                    },
                    child: Text(
                      "Get Started",
                      style: AppTextStyles.BalooThambi2_800_14.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.HeightResponsive),
          ],
        ),
      ),
    );
  }
}
