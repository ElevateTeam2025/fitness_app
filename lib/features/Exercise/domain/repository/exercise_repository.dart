import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';

import '../entity/difficulty_level_entity.dart';

abstract class ExerciseRepository {
  Future<Result<ExerciseResponseEntity>> getExercises(String muscleId, String difficultyId,);
  Future<Result<List<DifficultyLevelEntity>>> getLevels();
}
