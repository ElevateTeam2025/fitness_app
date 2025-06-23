import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/worksout/data/data_source/workout_remote_data_source.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_data_response_entity.dart';

import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/workout_repository.dart';

@Injectable(as: WorkoutRepository)
class WorkoutRepositoryImpl implements WorkoutRepository {
  final WorkoutRemoteDataSource _dataSource;

  WorkoutRepositoryImpl(this._dataSource);

  @override
  Future<Result<MusclesTebResponseEntity>> getMusclesTab() {
    return _dataSource.getMusclesTab();
  }

  @override
  Future<Result<MusclesDataResponseEntity>> getMusclesData(String id) {
    return _dataSource.getMusclesData(id);
  }
}
