import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../generated/l10n.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding + responsiveHeight(8),
        left: responsiveWidth(16),
        right: responsiveWidth(16),
        bottom: responsiveHeight(8),
      ),
      child: SizedBox(
        width: double.infinity,
        height: responsiveHeight(40),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  IconAssets.back,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Center(
              child: Text(
                S.of(context).profile,
                style: AppTextStyles.BalooThambi2_600_24.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
