import 'dart:ui';

import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/home/presentation/widget/home_catagory/category_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/screen_size_service.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import 'divider_widget.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: ScreenSizeService.width*0.9 ,
      padding: EdgeInsets.symmetric(
        horizontal: 16.WidthResponsive,
        vertical: 8.HeightResponsive,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyDarkColor,
        borderRadius: BorderRadius.circular(30.RadiusResponsive),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child:Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           CategoryItem(imagePath: ImageAssets.gymCat, catName: 'Gym'),
           DividerWidget(),
           CategoryItem(imagePath: ImageAssets.fitnessCat, catName: 'Fitness'),
           DividerWidget(),
           CategoryItem(imagePath: ImageAssets.aerobicsCat, catName: 'Aerobics'),
           DividerWidget(),
           CategoryItem(imagePath: ImageAssets.trainerCat, catName: 'Trainer'),
           DividerWidget(),
           CategoryItem(imagePath: ImageAssets.yogaCat, catName: 'Yoga'),
        
         ],
        ),
      ),
    );
  }
}
