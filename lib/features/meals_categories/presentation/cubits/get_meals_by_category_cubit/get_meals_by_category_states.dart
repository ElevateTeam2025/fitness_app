import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';

sealed class GetMealsByCategoryStates {}

final class GetMealsByCategoryInitialState extends GetMealsByCategoryStates {}

final class GetMealsByCategoryLoadingState extends GetMealsByCategoryStates {}

final class GetMealsByCategorySuccessState extends GetMealsByCategoryStates {
  final List<MealsByCategoryEntity> mealsByCategoryEntity;
  GetMealsByCategorySuccessState(this.mealsByCategoryEntity);
}

final class GetMealsByCategoryErrorState extends GetMealsByCategoryStates {
  final String message;
  GetMealsByCategoryErrorState({required this.message});
}
