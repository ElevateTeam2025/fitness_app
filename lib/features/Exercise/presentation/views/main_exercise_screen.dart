import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/di/injectable_initializer.dart';
import '../../../../core/utils/app_assets.dart';
import 'exercise_screen.dart';
import '../cubit/sign_in_cubit/exercise_view_model.dart';

class ExercisesWrapperScreen extends StatelessWidget {
  const ExercisesWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String muscleId = args['id'];
    final String? imageUrl = args['image'];
    final String? name = args['name'];

    return BlocProvider<ExerciseViewModel>(
      create: (_) => getIt<ExerciseViewModel>(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.exerciseBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: ExercisesScreen(
          muscleId: muscleId,
          imageUrl: imageUrl,
          muscleName: name ?? '',
        ),
        ),
      ),
    );
  }
}
