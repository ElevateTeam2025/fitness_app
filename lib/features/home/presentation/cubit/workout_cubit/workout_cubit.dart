import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/entity/exercise_entity.dart';
import '../../../domain/use_case/home_use_case.dart';

part 'workout_state.dart';

@injectable

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(this.workoutUseCase) : super(WorkoutInitial());
  final HomeUseCase workoutUseCase;


  Future<void> fetchWorkout()async{
    if(isClosed)
      return;
    emit(WorkoutLoading());

    final result = await workoutUseCase.call();
    switch(result)
        {
      case Success():
        if(result.data != null)
          {
            if(isClosed)
              return;
            emit(WorkoutSuccess(result.data! ));
          }

      case Error():
        if(isClosed)
          return;
        emit(WorkoutError(result.exception.toString()));
    }
  }

}
