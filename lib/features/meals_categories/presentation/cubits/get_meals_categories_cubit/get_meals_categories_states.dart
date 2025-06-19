import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';

sealed class GetMealsCategoriesStates {}

final class GetMealsCategoriesInitialState extends GetMealsCategoriesStates {}

final class GetMealsCategoriesLoadingState extends GetMealsCategoriesStates {}

final class GetMealsCategoriesSuccessState extends GetMealsCategoriesStates {
  final MealsCategoriesEntity mealsCategoriesEntity;
  GetMealsCategoriesSuccessState(this.mealsCategoriesEntity);
}

final class GetMealsCategoriesErrorState extends GetMealsCategoriesStates {
  final String message;

  GetMealsCategoriesErrorState({required this.message});
}
