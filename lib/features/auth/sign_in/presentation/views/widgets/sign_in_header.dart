import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';


class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24),
            vertical: responsiveHeight(24)),
            child: Center(
              child: Image.asset(
                ImageAssets.logo,
                height: responsiveHeight(60),
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(20)),
          Text(
            tr.heyThere,
            style: AppTextStyles.balooThambi2_400_16.copyWith(
              fontSize: 18,
              color: AppColors.whiteColor,
            ),
          ),
          Text(
            tr.welcomeBack,
            style: AppTextStyles.BalooThambi2_700_20.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
