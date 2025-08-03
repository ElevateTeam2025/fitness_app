import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../domain/entity/meals_categories_entity.dart';


class HomeMealsCard extends StatelessWidget {
  final HomeMealsCategoriesEntity meal;
  final bool isLarge;
  const HomeMealsCard({super.key, required this. meal,  this.isLarge = true});

  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: isLarge ? 6.heightResponsive :6.heightResponsive,
          // vertical: 6.HeightResponsive,
        ),
        width: isLarge ? 104.heightResponsive : 80.heightResponsive,
        height: isLarge ? 104.heightResponsive : 80.heightResponsive,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage.assetNetwork(
                placeholder: ImageAssets.loading,
                image:meal.strCategoryThumb ?? "" ,
                width: isLarge ? 104.heightResponsive : 80.heightResponsive,
                height: isLarge ? 104.heightResponsive : 80.heightResponsive,
                fit: BoxFit.fill,
                imageErrorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 60),
              ),
            ),

            Positioned(
              bottom: 0,

              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyDarkColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12.radiusResponsive),
                    // border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  width: isLarge ? 104.heightResponsive : 80.heightResponsive,
                  height: responsiveHeight(20),
                  alignment: Alignment.center,
                  child:   Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Text(meal.strCategory ?? "no loaded",
                      textAlign: TextAlign.center,
                      style:AppTextStyles.balooThambi2_400_12.copyWith(color: AppColors.whiteColor) ,),
                  )
              ),
            ),
          ],
        ),
      );

  }
}