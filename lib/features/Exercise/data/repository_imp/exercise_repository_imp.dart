
import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/difficulty_level_entity.dart';
import '../../domain/repository/exercise_repository.dart';
import '../data_source/exercise_remote_data_source.dart';
import 'package:fitness_app/features/Exercise/data/model/exercise_dto_mapper.dart';


@Injectable(as: ExerciseRepository)
class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource _remoteDataSource;

  ExerciseRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<ExerciseResponseEntity>> getExercises(String muscleId, String difficultyId,) async{
    return await executeApi(() async {
      final dto = await _remoteDataSource.getExercises(muscleId, difficultyId,);
      return dto.toEntity();
    });
  }
  @override
  Future<Result<List<DifficultyLevelEntity>>> getLevels() async{
    return await executeApi(() async {
      final dto = await _remoteDataSource.getLevels();
      return dto.map((dto) => dto.toEntity()).toList();
    });
  }

}



