import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubit/profile_view_model.dart';

void showLogoutDialog(BuildContext parentContext) {
  showDialog(
    context: parentContext,
    builder: (BuildContext context) {
      return Builder(
        builder: (innerContext) {
          return AlertDialog(
            title: SizedBox(
              height: responsiveHeight(50),
              child: Center(child: Text(S.of(parentContext).logout)),
            ),
            content: SizedBox(
              height: responsiveHeight(40),
              child: Center(child: Text(S.of(parentContext).confirmLogout)),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: responsiveHeight(50),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(innerContext).pop();
                      },
                      child: Text(
                        S.of(parentContext).cancel,
                        style: AppTextStyles.BalooThambi2_500_13.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: responsiveWidth(16)),
                  SizedBox(
                    height: responsiveHeight(50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: Size(
                          responsiveWidth(100),
                          responsiveHeight(40),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(innerContext).pop();
                        BlocProvider.of<ProfileViewModel>(
                          parentContext,
                        ).doIntent(LogoutClickedIntent());
                      },
                      child: Text(
                        S.of(parentContext).logout,
                        style: AppTextStyles.BalooThambi2_500_14.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
