import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubit/profile_view_model.dart';

void showLogoutDialog(BuildContext parentContext) {
  final logoutText = S.of(parentContext).logout;
  final confirmLogoutText = S.of(parentContext).confirmLogout;
  final cancelText = S.of(parentContext).cancel;

  showGeneralDialog(
    context: parentContext,
    barrierDismissible: true,
    barrierLabel: "Logout",
    barrierColor: Colors.black.withOpacity(0.6),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const SizedBox.shrink();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeIn,
      );

      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: curvedAnimation,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: AppColors.greyDark2,
            titlePadding: EdgeInsets.only(top: responsiveHeight(24)),
            contentPadding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(20),
              vertical: responsiveHeight(8),
            ),
            title: Center(
              child: Text(
                logoutText,
                style: AppTextStyles.BalooThambi2_600_24.copyWith(color: AppColors.whiteColor),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  confirmLogoutText,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.BalooThambi2_600_16.copyWith(color: AppColors.greyColor),
                ),
                SizedBox(height: responsiveHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.primaryColor),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          cancelText,
                          style: AppTextStyles.BalooThambi2_500_13.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: responsiveWidth(16)),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          minimumSize: Size.fromHeight(responsiveHeight(48)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          BlocProvider.of<ProfileViewModel>(parentContext)
                              .doIntent(LogoutClickedIntent());
                        },
                        child: Text(
                          logoutText,
                          style: AppTextStyles.BalooThambi2_500_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
