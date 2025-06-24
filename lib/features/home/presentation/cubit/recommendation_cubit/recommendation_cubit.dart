import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/entity/exercise_entity.dart';
import '../../../domain/use_case/home_use_case.dart';
part 'recommendation_state.dart';

@injectable

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit(this.workoutUseCase) : super(RecommendationInitial());
  final HomeUseCase workoutUseCase;


  Future<void> fetchWorkout()async{
    if(isClosed)
      return;

    emit(RecommendationLoading());

    final result =

    await workoutUseCase.executeRecommendation("67c79f3526895f87ce0aa971",
        "67c797e226895f87ce0aa94b",4);
    switch(result)
        {
      case Success():
        if(result.data != null)
          {
            if(isClosed)
              return;

            emit(RecommendationSuccess(result.data!));

          }

      case Error():
        if(isClosed)
          return;
        emit(RecommendationError(result.exception.toString()));
    }

  }

}
