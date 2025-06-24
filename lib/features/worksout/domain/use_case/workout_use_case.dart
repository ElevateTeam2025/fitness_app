import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_data_response_entity.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../repository/workout_repository.dart';

@injectable
class WorkoutUseCase {
  final WorkoutRepository _repository;

  WorkoutUseCase(this._repository);

  Future<Result<MusclesTebResponseEntity>> getMusclesTab() {
    return _repository.getMusclesTab();
  }

  Future<Result<MusclesDataResponseEntity>> invoke(String id) {
    return _repository.getMusclesData(id);
  }
}
