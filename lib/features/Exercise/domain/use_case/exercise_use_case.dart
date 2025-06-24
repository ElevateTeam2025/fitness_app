import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/domain/repository/exercise_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/difficulty_level_entity.dart';


@injectable
class ExercisesUseCase {
  final ExerciseRepository _repository;

  ExercisesUseCase(this._repository);

  Future<Result<ExerciseResponseEntity>> call(String muscleId, String difficultyId,) async{
    return await _repository.getExercises(muscleId, difficultyId,);
  }

  Future<Result<List<DifficultyLevelEntity>>> getLevels() async{
    return await _repository.getLevels();
  }

}


