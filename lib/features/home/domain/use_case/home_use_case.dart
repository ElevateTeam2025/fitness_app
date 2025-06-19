

import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../entity/exercise_entity.dart';
import '../repo/home_repo.dart';

@injectable
class HomeUseCase {
  final HomeRepo repository;

  HomeUseCase(this.repository);

  Future<Result<List<ExerciseEntity>>> executeAllWorkouts() async {
    return await repository.getAllWorkouts();
  }

  Future<Result<List<ExerciseEntity>>> executeRecommendation() async {
    return await repository.getRecommendation();
  }

}
