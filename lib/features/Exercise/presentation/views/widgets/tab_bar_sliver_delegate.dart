import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class TabBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final bool isCollapsed;

  TabBarSliverDelegate({
    required this.tabBar,
    required this.isCollapsed,
  });

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isCollapsed
              ? [AppColors.blackColor, AppColors.blackColor]
              : [Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.5)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.radiusResponsive),
          bottomRight: Radius.circular(32.radiusResponsive),
        ),
      ),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant TabBarSliverDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar || isCollapsed != oldDelegate.isCollapsed;
  }
}