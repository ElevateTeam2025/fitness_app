import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_data_response_entity.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';

abstract class WorkoutRepository {
  Future<Result<MusclesTebResponseEntity>> getMusclesTab();
  Future<Result<MusclesDataResponseEntity>> getMusclesData(String id);
}
