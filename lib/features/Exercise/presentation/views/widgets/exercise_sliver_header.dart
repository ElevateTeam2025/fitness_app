import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';


class ExerciseSliverHeader extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isCollapsed;

  const ExerciseSliverHeader({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: responsiveHeight(244),
      backgroundColor: isCollapsed ? AppColors.blackColor : Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final collapsedHeight = kToolbarHeight + MediaQuery.of(context).padding.top;
          final isReallyCollapsed = constraints.maxHeight <= collapsedHeight + 20;

          return FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(16),
              vertical: responsiveHeight(12),
            ),
            title: isReallyCollapsed
                ? Row(
              children: [

                SizedBox(width: responsiveWidth(40)),

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    width: responsiveWidth(36),
                    height: responsiveHeight(36),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: responsiveWidth(8)),

                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.BalooThambi2_600_16.copyWith(
                      color: AppColors.whiteColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            )
                : null,
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isCollapsed
                          ? [AppColors.blackColor, AppColors.blackColor]
                          : [Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.5)],
                    ),
                  ),
                ),

                if (!isReallyCollapsed)
                  Positioned(
                    bottom: responsiveHeight(30),
                    left: responsiveWidth(16),
                    right: responsiveWidth(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.BalooThambi2_600_18.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: responsiveHeight(8)),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
