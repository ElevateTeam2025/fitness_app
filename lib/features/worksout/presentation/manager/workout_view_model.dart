import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_data_response_entity.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';
import 'package:fitness_app/features/worksout/domain/use_case/workout_use_case.dart';
import 'package:fitness_app/features/worksout/presentation/manager/workout_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';

@injectable
class WorkoutViewModel extends Cubit<WorkoutState> {
  WorkoutViewModel(this._useCase) : super(GetMusclesTabLoadingState());
  final WorkoutUseCase _useCase;
  int selectedTab = 0;
  List<MusclesComponentEntity> musclesTab = [];
  List<MusclesDataListEntity> musclesData = [];

  void doIntent(WorkoutIntent intent) async {
    switch (intent) {
      case GetMusclesTabIntent():
        await _getMusclesTab();
        break;
      case ChangeTabIntent():
        changeTab(intent.index);
        break;
      case GetAllMusclesDataIntent():
        await _getMusclesData(intent.id);
        break;
    }
  }

  Future<void> _getMusclesTab() async {
    emit(GetMusclesTabLoadingState());
    var result = await _useCase.getMusclesTab();
    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          selectedTab=0;
          musclesTab = data.musclesGroup!;
          emit(GetMusclesTabSuccessState(musclesTab));
          break;
        } else {
          emit(GetMusclesTabErrorState(data.message!));
        }
      case Error():
        emit(GetMusclesTabErrorState(result.exception!));
        break;
    }
  }

  void changeTab(int index)  {
    selectedTab = index;
    emit(ChangeTabState());
  }

  Future<void> _getMusclesData(String id) async {
    emit(GetAllMusclesDataLoadingState());
    var result = await _useCase.invoke(id);
    switch (result) {
      case Success():
        var data = result.data;
        if (data!.message == "success") {
          musclesData = data.muscles!;
          emit(GetAllMusclesDataSuccessState(data.muscles!));
          break;
        } else {
          emit(GetAllMusclesDataErrorState(data.message!));
        }
      case Error():
        emit(GetAllMusclesDataErrorState(result.exception!));
        break;
    }
  }
}

sealed class WorkoutIntent {}

class GetMusclesTabIntent extends WorkoutIntent {}

class ChangeTabIntent extends WorkoutIntent {
  final int index;

  ChangeTabIntent(this.index);
}

class GetAllMusclesDataIntent extends WorkoutIntent {
  String id;

  GetAllMusclesDataIntent(this.id);
}
