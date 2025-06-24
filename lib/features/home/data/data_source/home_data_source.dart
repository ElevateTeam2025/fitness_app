



import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../../../core/api/api_client.dart';

import '../../../../core/api/meals_api_client.dart';
import '../model/exercise_response_dto.dart';
import '../model/meal_categories_reponse.dart';

abstract class HomeDataSource{

  Future<ExercisesResponseDTO> getAllExercises();
  Future<ExercisesResponseDTO> getRecommendation(String targetMuscleGroupId, String difficultyLevelId, int limit);
  Future<HomeMealCategoriesReponse> getHomeMealsCategories();
}



@Injectable(as: HomeDataSource)
class HomeDataSourceImp implements  HomeDataSource{
   final ApiClient _apiClient;
   final MealsApiClient _mealsApiClient;

  HomeDataSourceImp(this._apiClient, this._mealsApiClient);

  @override
  Future<ExercisesResponseDTO>  getAllExercises() async{
    return _apiClient.getAllExercises() ;
  }

  @override
  Future<ExercisesResponseDTO> getRecommendation(String targetMuscleGroupId,
      String difficultyLevelId, int limit)async {
    final response = await _apiClient.getRecommendExercises(targetMuscleGroupId,
        difficultyLevelId, limit);
    log("getRecommendation from data source");
    return response;
  }

  @override
  Future<HomeMealCategoriesReponse> getHomeMealsCategories() {
    return _mealsApiClient.getHomeMealsCategories();
  }
}

