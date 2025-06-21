import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';

class ExerciseTabBar extends StatelessWidget {
  final TabController controller;
  final List<DifficultyLevelEntity> levels;

  const ExerciseTabBar({
    super.key,
    required this.controller,
    required this.levels,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.5),
            ],
          ),
        ),
        child: TabBar(
          controller: controller,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
          labelColor: AppColors.whiteColor,
          unselectedLabelColor: AppColors.whiteColor.withOpacity(0.5),
          indicatorPadding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(6),
            vertical: responsiveHeight(8),
          ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20.RadiusResponsive),
            color: AppColors.primaryColor,
          ),
          tabs: levels.map(
                (e) => Tab(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                child: Text(e.name, style: AppTextStyles.BalooThambi2_600_12),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
