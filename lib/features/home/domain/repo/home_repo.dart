

import '../../../../../core/common/result.dart';
import '../entity/exercise_entity.dart';

abstract class HomeRepo{

  Future<Result<List<ExerciseEntity>>> getAllWorkouts();
  Future<Result<List<ExerciseEntity>>> getRecommendation();
}
