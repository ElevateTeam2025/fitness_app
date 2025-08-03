import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';

class TabBarItemWidget extends StatelessWidget {
  final int currentIndex;
  final int index;
  final String icon;
  final String label;
  final VoidCallback onTap;

  const TabBarItemWidget({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(

            duration: const Duration(milliseconds: 300),
            child: ImageIcon(
              AssetImage(icon),
              size: 28,
              color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: isSelected
                ? Text(
              label,
              key: ValueKey(label),
                style: AppTextStyles.balooThambi2_400_12.copyWith(color: AppColors.primaryColor),
            )
                : const SizedBox(height: 0,),
          ),
        ],
      ),
    );
  }
}

