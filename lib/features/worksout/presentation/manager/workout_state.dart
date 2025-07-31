import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';

import '../../domain/entity/muscles_data_response_entity.dart';

sealed class WorkoutState {}

class GetMusclesTabLoadingState extends WorkoutState {}

class GetMusclesTabErrorState extends WorkoutState {
  final String message;

  GetMusclesTabErrorState(this.message);
}

class GetMusclesTabSuccessState extends WorkoutState {
  List<MusclesComponentEntity> muscles;

  GetMusclesTabSuccessState(this.muscles);
}

class ChangeTabState extends WorkoutState {}

class GetAllMusclesDataLoadingState extends WorkoutState {}

class GetAllMusclesDataErrorState extends WorkoutState {
  final String message;

  GetAllMusclesDataErrorState(this.message);
}

class GetAllMusclesDataSuccessState extends WorkoutState {
  List<MusclesDataListEntity> allMuscles;

  GetAllMusclesDataSuccessState(this.allMuscles);
}
