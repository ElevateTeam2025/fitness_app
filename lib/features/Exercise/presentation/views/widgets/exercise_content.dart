import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../domain/entity/exercise_response_entity.dart';
import 'exercise_list.dart';

class ExerciseContent extends StatelessWidget {
  final List<Exercises> exercises;
  final bool isLoading;
  final String noExercisesText;

  const ExerciseContent({
    super.key,
    required this.exercises,
    required this.isLoading,
    required this.noExercisesText,
  });

  @override
  Widget build(BuildContext context) {
    if (exercises.isEmpty && !isLoading) {
      return SliverFillRemaining(
        child: Center(
          child: Text(
            noExercisesText,
            style: AppTextStyles.balooThambi2_400_14.copyWith(color: AppColors.whiteColor),
          ),
        ),
      );
    }
    return SliverFillRemaining(
      child: ExerciseList(exercises: exercises, isLoading: isLoading),
    );
  }
}
