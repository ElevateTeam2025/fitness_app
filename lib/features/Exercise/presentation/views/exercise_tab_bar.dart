import 'package:fitness_app/features/Exercise/presentation/views/widgets/tab_bar_sliver_delegate.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ExerciseTabBar extends StatelessWidget {
  final TabController tabController;
  final List levels;
  final bool isCollapsed;

  const ExerciseTabBar({
    super.key,
    required this.tabController,
    required this.levels,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: TabBarSliverDelegate(
        tabBar: TabBar(
          controller: tabController,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
          labelColor: AppColors.whiteColor,
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          indicatorPadding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(6),
            vertical: responsiveHeight(8),
          ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor,
          ),
          tabs: levels
              .map(
                (e) => Tab(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                child: Text(e.name, style: AppTextStyles.balooThambi2_600_12),
              ),
            ),
          )
              .toList(),
        ),
        isCollapsed: isCollapsed,
      ),
    );
  }
}
