import 'package:flutter/material.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/common/height_width_extention.dart';

import '../../../Exercise/presentation/views/widgets/shimmer_placeholder_widget.dart';
import '../../domain/entity/exercise_entity.dart';
import 'home_exercise_card.dart';



class HomeExerciseList extends StatelessWidget {
  final List<Exercises> exercises;
  final bool isLarge ;
  const HomeExerciseList({
    super.key,
    required this.exercises,  this.isLarge = true,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLarge ? 104.HeightResponsive : 80.HeightResponsive,
      child: ListView.builder(
        itemCount:  exercises.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HomeExerciseCard(exercise: exercises[index],isLarge: isLarge,);
        },
      ),
    );
  }
}