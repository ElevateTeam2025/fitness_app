

import 'dart:developer';


import 'package:injectable/injectable.dart';

import '../../../../core/api/api_client.dart';
import '../model/exercise_response_dto.dart';

abstract class HomeDataSource{

  Future<ExerciseResponseDTO> getAllWorkouts();
  Future<ExerciseResponseDTO> getRecommendation();
}



@Injectable(as: HomeDataSource)
class CategoryDataSourceImp implements  HomeDataSource{
  final ApiClient _apiClient;

  CategoryDataSourceImp(this._apiClient);

  @override
  Future<ExerciseResponseDTO> getAllWorkouts() async{

      final response=await _apiClient.getExercises();

      log("Workouts from data source");
      return response;
  }

  @override
  Future<ExerciseResponseDTO> getRecommendation()async {
    final response = await _apiClient.getExercises();
    log("getRecommendation from data source");
    return response;
  }

}

