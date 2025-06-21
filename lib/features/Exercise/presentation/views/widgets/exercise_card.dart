import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/video_widget/video_draggable_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/youtube_utils.dart';
import '../../../domain/entity/exercise_response_entity.dart';

class ExerciseCard extends StatelessWidget {
  final Exercises exercise;
  const ExerciseCard({super.key, required this.exercise});


  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = YoutubeUtils.getThumbnail(exercise.shortYoutubeDemonstrationLink);

    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage.assetNetwork(
          placeholder: ImageAssets.loading,
          image: thumbnailUrl,
          width: responsiveWidth(60),
          height: responsiveHeight(70),
          fit: BoxFit.cover,
          imageErrorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 60),
        ),
      ),
      title: Text(
        exercise.exercise ?? '',
        style: AppTextStyles.BalooThambi2_600_16.copyWith(color:AppColors.whiteColor),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: responsiveHeight(4)),
          Text(
            exercise.posture ?? '',
              style: AppTextStyles.BalooThambi2_400_14.copyWith(color: AppColors.whiteColor),
          ),
          SizedBox(height: responsiveHeight(2)),
          Text(
            exercise.primeMoverMuscle ?? '',
            style: AppTextStyles.BalooThambi2_400_14.copyWith(color:  AppColors.whiteColor),
          ),
        ],
      ),
      trailing: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(8),vertical: responsiveHeight(8)),
          child: Icon(AppIcons.play, color: AppColors.blackColor),
        ),
      ),
      onTap: () {
        final videoLink = exercise.shortYoutubeDemonstrationLink;
        if (videoLink == null || videoLink.isEmpty) return;

        showDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.8),
          builder: (_) => VideoDraggableDialog(youtubeUrl: videoLink),
        );
      },
    );
  }
}
