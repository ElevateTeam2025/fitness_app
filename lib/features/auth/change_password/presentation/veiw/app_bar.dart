import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ChangePasswordCustomAppBar extends StatelessWidget {
  const ChangePasswordCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.HeightResponsive),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 16.WidthResponsive),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50.RadiusResponsive),
              ),
              child: Image.asset(
                IconAssets.backIcon,
                height: 30.HeightResponsive,
                width: 30.WidthResponsive,
              ),
            ),
          ),
          SizedBox(width: 24.WidthResponsive),
          Text(
            'Change password',
            style: AppTextStyles.BalooThambi2_400_18.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}