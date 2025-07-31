import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/services/shared_preference_services.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';
import 'package:fitness_app/generated/l10n.dart' show S;
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomChatbotRow extends StatelessWidget {
   CustomChatbotRow({super.key,required this.onPressed});
   void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 14.RadiusResponsive,
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                IconAssets.backIcon,
                scale: .8,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${tr.hi} ${SharedPreferenceServices.getData(AppConstants.firstName)},",
                style: AppTextStyles.BalooThambi2_600_16.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                tr.iAmYourSmartCoach,
                style: AppTextStyles.BalooThambi2_600_18.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(IconAssets.menuIcon, scale: 0.9),
          ),
        ],
      ),
    );
  }
}

