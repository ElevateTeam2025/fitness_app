import 'dart:developer';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:fitness_app/features/meals_categories/domain/repo/get_meals_by_category_repo.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealsByCategoryCubit extends Cubit<GetMealsByCategoryStates> {
  final GetMealsByCategoryRepo _getMealsByCategoryRepo;
  GetMealsByCategoryCubit(GetMealsByCategoryRepo getMealsByCategoryRepo)
    : _getMealsByCategoryRepo = getMealsByCategoryRepo,
      super(GetMealsByCategoryInitialState());

  doIntents(GetMealByCategoryIntent intent, {required String category}) async {
    switch (intent) {
      case OnClickGetMealsByCategoryIntent():
        await _getMealsByCategory(category);
        break;
    }
  }

  Future<void> _getMealsByCategory(String category) async {
    emit(GetMealsByCategoryLoadingState());
    final Result<List<MealsByCategoryEntity>> result =
        await _getMealsByCategoryRepo.getMealsByCategory(category);
    switch (result) {
      case Success():
        log('success in the get meals by category cubit');
        log(result.data!.length.toString() + "qqqqqqqqqqqqqqqqqqqqqqqqqqqq");
        emit(GetMealsByCategorySuccessState(result.data!));
        break;
      case Error():
        log('error in the get meals by category cubit');
        emit(
          GetMealsByCategoryErrorState(message: result.exception.toString()),
        );
        break;
    }
  }
}

sealed class GetMealByCategoryIntent {}

class OnClickGetMealsByCategoryIntent extends GetMealByCategoryIntent {}
