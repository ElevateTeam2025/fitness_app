import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';

class CustomLogoutWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const CustomLogoutWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.heightResponsive, horizontal: 4.widthResponsive),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 16.widthResponsive),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.balooThambi2_400_13.copyWith(color: AppColors.primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // SizedBox(width: 8),
            SizedBox(
              width: 20.widthResponsive,
              child: trailing ??
                  Icon(AppIcons.arrowRight, color: AppColors.primaryColor, size: 14),
            ),
          ],
        ),
      ),
    );
  }
}
