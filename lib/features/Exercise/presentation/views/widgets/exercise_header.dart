import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class ExerciseHeader extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isCollapsed;

  const ExerciseHeader({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isCollapsed,
  });

  bool _isNetworkImage(String url) => url.startsWith('http');

  @override
  Widget build(BuildContext context) {
    final collapsedHeight = kToolbarHeight + MediaQuery.of(context).padding.top;

    final safeUrl = _resolveImage(imageUrl);

    final imageWidget = safeUrl.startsWith('http')
        ? Image.network(
      safeUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(ImageAssets.logo, fit: BoxFit.cover);
      },
    )
        : Image.asset(safeUrl, fit: BoxFit.cover);


    final collapsedImage = safeUrl.startsWith('http')
        ? Image.network(
      safeUrl,
      width: 36.WidthResponsive,
      height: 36.HeightResponsive,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          ImageAssets.logo,
          width: 36.WidthResponsive,
          height: 36.HeightResponsive,
          fit: BoxFit.cover,
        );
      },
    )
        : Image.asset(
      safeUrl,
      width: 36.WidthResponsive,
      height: 36.HeightResponsive,
      fit: BoxFit.cover,
    );

    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 244.HeightResponsive,
      backgroundColor: isCollapsed ? AppColors.blackColor : Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isReallyCollapsed = constraints.maxHeight <= collapsedHeight + 20;
          return FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive, vertical: 12.HeightResponsive),
            title: isReallyCollapsed
                ? Row(
              children: [
                SizedBox(width: 40.WidthResponsive),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: collapsedImage,
                ),
                SizedBox(width: 8.WidthResponsive),
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
                imageWidget,
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
                    bottom: 30.HeightResponsive,
                    left: 16.WidthResponsive,
                    right: 16.WidthResponsive,
                    child: Text(
                      title,
                      style: AppTextStyles.BalooThambi2_600_18.copyWith(color: AppColors.whiteColor),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _resolveImage(String? url) {
    if (url == null || url.trim().isEmpty || url == 'null') {
      return ImageAssets.logo;
    }
    return url;
  }
}
