

import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../entity/exercise_entity.dart';
import '../entity/meals_categories_entity.dart';
import '../repo/home_repo.dart';

@injectable
class HomeUseCase {
  final HomeRepo repository;

  HomeUseCase(this.repository);

  Future<Result<ExercisesResponseEntity>> call() async{
    return await repository.getExercises();
  }

  Future<Result<ExercisesResponseEntity>> executeRecommendation(String targetMuscleGroupId,
      String difficultyLevelId, int limit) async {
    return await repository.getRecommendation( targetMuscleGroupId,  difficultyLevelId,  limit);
  }
  Future<Result<List<HomeMealsCategoriesEntity>>> getHomeMealsCategories() async {
    return await repository.getHomeMealsCategories() ;
  }

}
