import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/utils/app_assets.dart';

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

  bool _isNetworkImage(String url) {
    return url.startsWith('http');
  }

  @override
  Widget build(BuildContext context) {
    final collapsedHeight = kToolbarHeight + MediaQuery.of(context).padding.top;

    final imageWidget = _isNetworkImage(imageUrl)
        ? Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(ImageAssets.logo, fit: BoxFit.cover);
      },
    )
        : Image.asset(imageUrl, fit: BoxFit.cover);

    final collapsedImage = _isNetworkImage(imageUrl)
        ? Image.network(
      imageUrl,
      width: responsiveWidth(36),
      height: responsiveHeight(36),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          ImageAssets.logo,
          width: responsiveWidth(36),
          height: responsiveHeight(36),
          fit: BoxFit.cover,
        );
      },
    )
        : Image.asset(
      imageUrl,
      width: responsiveWidth(36),
      height: responsiveHeight(36),
      fit: BoxFit.cover,
    );

    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: responsiveHeight(244),
      backgroundColor: isCollapsed ? AppColors.blackColor : Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
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
                  child: collapsedImage,
                ),
                SizedBox(width: responsiveWidth(8)),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.balooThambi2_600_16.copyWith(
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
                imageWidget,
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isCollapsed
                          ? [AppColors.blackColor, AppColors.blackColor]
                          : [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.5)
                      ],
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
                          style: AppTextStyles.balooThambi2_600_18.copyWith(
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
