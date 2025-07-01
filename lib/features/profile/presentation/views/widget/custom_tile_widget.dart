import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';

class CustomTileWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const CustomTileWidget({
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
        padding: EdgeInsets.symmetric(vertical: 4.HeightResponsive, horizontal: 4.WidthResponsive),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 16.WidthResponsive),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.BalooThambi2_400_13.copyWith(color: AppColors.whiteColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // SizedBox(width: 8),
            SizedBox(
              width: 20.WidthResponsive,
              child: trailing ??
                  Icon(AppIcons.arrowRight, color: AppColors.primaryColor, size: 14),
            ),
          ],
        ),
      ),
    );
  }
}
