import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.whiteColor,
          radius: 50.RadiusResponsive,
          backgroundImage:
              userData.photo == null || userData.photo!.isEmpty
                  ? AssetImage(ImageAssets.logo)
                  : NetworkImage(userData.photo!),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: responsiveHeight(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userData.firstName ?? '',
                    style: AppTextStyles.BalooThambi2_600_18.copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(width: responsiveWidth(8)),
                  Text(
                    userData.lastName ?? '',
                    style: AppTextStyles.BalooThambi2_600_18.copyWith(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
