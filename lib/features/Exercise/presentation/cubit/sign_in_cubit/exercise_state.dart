import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import '../../../domain/entity/difficulty_level_entity.dart';

sealed class ExerciseState {}

class InitialExerciseState extends ExerciseState {}

class LoadingExerciseState extends ExerciseState {}

class SuccessExerciseState extends ExerciseState {
  final ExerciseResponseEntity data;
  SuccessExerciseState(this.data);
}

class ErrorExerciseState extends ExerciseState {
  final String message;
  ErrorExerciseState(this.message);
}
//////////////// Level state ///////////////////

class LoadingLevelsState extends ExerciseState {}

class SuccessLevelsState extends ExerciseState {
  final List<DifficultyLevelEntity> levels;
  SuccessLevelsState(this.levels);
}

class ErrorLevelsState extends ExerciseState {
  final String message;
  ErrorLevelsState(this.message);
}