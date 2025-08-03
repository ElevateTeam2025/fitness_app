import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class EditProfileCustomAppBar extends StatelessWidget {
  const EditProfileCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              height: 25.heightResponsive,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(
                  50.radiusResponsive,
                ),
              ),
              child: Image(image: AssetImage(IconAssets.backIcon)),
            ),
          ),
          SizedBox(width: 88.widthResponsive),
          Text(
            'Edit Profile',
            style: AppTextStyles.BalooThambi2_600_20.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


