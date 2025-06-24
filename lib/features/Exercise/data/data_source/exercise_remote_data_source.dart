import 'package:fitness_app/core/api/api_client.dart';
import 'package:injectable/injectable.dart';

import '../model/difficult_level_dto.dart';
import '../model/exercise_dto.dart';

abstract class ExerciseRemoteDataSource {
  Future<ExerciseResponseDTO> getExercises(String muscleId, String difficultyId,);
  Future<List<DifficultyLevelDTO>> getLevels();
}

@Injectable(as: ExerciseRemoteDataSource)
class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final ApiClient _apiClient;

  ExerciseRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ExerciseResponseDTO> getExercises(String muscleId, String difficultyId) async{
    return await _apiClient.getExercisesByMuscleAndDifficulty(muscleId, difficultyId,);
  }
  @override
  Future<List<DifficultyLevelDTO>> getLevels() async {
    final response = await _apiClient.getLevels();
    return response.levels;
  }

}





