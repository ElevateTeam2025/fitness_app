import 'package:flutter/material.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_card.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/shimmer_placeholder_widget.dart';

class ExerciseList extends StatelessWidget {
  final List<Exercises> exercises;
  final bool isLoading;

  const ExerciseList({
    super.key,
    required this.exercises,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(12),
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16.RadiusResponsive),
      ),
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(responsiveWidth(4), 0, responsiveWidth(4), 0),
        itemCount: isLoading ? 6 : exercises.length,
        separatorBuilder: (_, __) => Divider(color: AppColors.blackColor),
        itemBuilder: (context, index) {
          if (isLoading) {
            return const ShimmerExerciseCardPlaceholder();
          } else {
            return ExerciseCard(exercise: exercises[index]);
          }
        },
      ),
    );
  }
}
