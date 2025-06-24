

import '../../../../../core/common/result.dart';

import '../entity/exercise_entity.dart';
import '../entity/meals_categories_entity.dart';

abstract class HomeRepo{

  Future<Result<ExercisesResponseEntity>> getExercises() ;
 Future<Result<ExercisesResponseEntity>>
 getRecommendation(String targetMuscleGroupId, String difficultyLevelId, int limit);
  Future<Result<List<HomeMealsCategoriesEntity>>> getHomeMealsCategories();
}
