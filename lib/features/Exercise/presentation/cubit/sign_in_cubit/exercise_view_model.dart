import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/Exercise/domain/use_case/exercise_use_case.dart';
import 'exercise_state.dart';

@injectable
class ExerciseViewModel extends Cubit<ExerciseState> {
  final ExercisesUseCase _useCase;

  ExerciseViewModel(this._useCase) : super(InitialExerciseState());

  void doIntent(ExerciseIntent intent) {
    if (intent is LoadExercisesIntent) {
      _loadExercises(intent.muscleId, intent.difficultyId);
    } else if (intent is LoadLevelsIntent) {
      _loadLevels();
    }
  }

  void _loadExercises(String muscleId, String difficultyId,) async {
    emit(LoadingExerciseState());
    final result = await _useCase(muscleId, difficultyId);
    switch (result) {
      case Success():
        emit(SuccessExerciseState(result.data!));
      case Error():
        emit(ErrorExerciseState(result.exception ?? "Unknown error"));
    }
  }

  void _loadLevels() async {
    emit(LoadingLevelsState());
    final Result result = await _useCase.getLevels();

    switch (result) {
      case Success():
        emit(SuccessLevelsState(result.data!));
        case Error():
          emit(ErrorLevelsState(result.exception ?? "Unknown error"));
    }
  }
}
sealed class ExerciseIntent {}

class LoadExercisesIntent extends ExerciseIntent {
  final String muscleId;
  final String difficultyId;

  LoadExercisesIntent(this.muscleId, this.difficultyId,);
}
class LoadLevelsIntent extends ExerciseIntent {}