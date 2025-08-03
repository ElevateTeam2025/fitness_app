
import 'package:fitness_app/features/home/data/model/exercise_dto_mapper.dart';

import 'package:injectable/injectable.dart';


import '../../../../../core/common/result.dart';
import '../../../../core/api/api_execute.dart';
import '../../domain/entity/exercise_entity.dart';
import '../../domain/entity/meals_categories_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/home_data_source.dart';
import '../model/meal_categories_reponse.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDataSource _remoteDataSource;

  HomeRepoImpl(this._remoteDataSource);

  @override
  Future<Result<ExercisesResponseEntity>> getExercises() async {
    return await executeApi(() async {
      final dto = await _remoteDataSource.getAllExercises();
      return dto.toEntity();
    });
  }

  @override
  Future<Result<ExercisesResponseEntity>>
  getRecommendation( String targetMuscleGroupId, String difficultyLevelId, int limit)
  async {
    return await executeApi(() async {
      final dto = await _remoteDataSource.getRecommendation( targetMuscleGroupId ,  difficultyLevelId,  limit);
      return dto.toEntity();
    });
  }

  @override
  Future<Result<List<HomeMealsCategoriesEntity>>> getHomeMealsCategories() async {
    return await executeApi<List<HomeMealsCategoriesEntity>>(() async {
      final HomeMealCategoriesReponse response = await _remoteDataSource.getHomeMealsCategories();

      List<HomeMealsCategoriesEntity> mealsCategoriesEntity = response.toEntity();
      return mealsCategoriesEntity;
    });
  }
}









