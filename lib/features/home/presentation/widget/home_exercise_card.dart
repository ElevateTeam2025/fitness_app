import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/home/domain/entity/exercise_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/youtube_utils.dart';


class HomeExerciseCard extends StatelessWidget {
  final Exercises exercise;
  final bool isLarge;
  const HomeExerciseCard({super.key, required this. exercise,  this.isLarge = true});

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = YoutubeUtils.getThumbnail(exercise.shortYoutubeDemonstrationLink);
    return
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: isLarge ? 6.HeightResponsive :6.HeightResponsive,
         // vertical: 6.HeightResponsive,
        ),
      width: isLarge ? 104.HeightResponsive : 80.HeightResponsive,
      height: isLarge ? 104.HeightResponsive : 80.HeightResponsive,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage.assetNetwork(
              placeholder: ImageAssets.loading,
              image: thumbnailUrl,
              width: isLarge ? 104.HeightResponsive : 80.HeightResponsive,
              height: isLarge ? 104.HeightResponsive : 80.HeightResponsive,
              fit: BoxFit.fill,
              imageErrorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 60),
            ),
          ),

          Positioned(
            bottom: 0,

            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greyDarkColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.RadiusResponsive),
                 // border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                width: isLarge ? 104.HeightResponsive : 80.HeightResponsive,
              height: responsiveHeight(20),
                alignment: Alignment.center,
                child:   Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Text(exercise.exercise ?? "no loaded",
                    textAlign: TextAlign.center,
                    style:AppTextStyles.BalooThambi2_400_12.copyWith(color: AppColors.whiteColor) ,),
                )
            ),
          ),
        ],
      ),
    );

  }
}

