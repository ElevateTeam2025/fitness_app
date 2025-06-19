import 'dart:developer';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';
import 'package:fitness_app/features/meals_categories/domain/repo/get_meals_categories_repo.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealsCategoriesCubit extends Cubit<GetMealsCategoriesStates> {
  final GetMealsCategoriesRepo _getMealsCategoriesRepo;

  GetMealsCategoriesCubit({
    required GetMealsCategoriesRepo getMealsCategoriesRepo,
  }) : _getMealsCategoriesRepo = getMealsCategoriesRepo,

       super(GetMealsCategoriesInitialState());

  doIntents(GetMealsCategoriesIntent intent) {
    switch (intent) {
      case OnClickGetMealsCategories():
        _getMealsCategories();
        break;
    }
  }

  Future<void> _getMealsCategories() async {
    emit(GetMealsCategoriesLoadingState());

    final Result<MealsCategoriesEntity> result = await _getMealsCategoriesRepo
        .getMealsCategories();
    switch (result) {
      case Success():
        log('success in the get meals categories cubit');
        emit(GetMealsCategoriesSuccessState(result.data!));
        break;
      case Error():
        log('error in the get meals categories cubit'+result.exception.toString());
        emit(
          GetMealsCategoriesErrorState(message: result.exception.toString()),
        );
        break;
    }
  }
}

sealed class GetMealsCategoriesIntent {}

class OnClickGetMealsCategories extends GetMealsCategoriesIntent {}
