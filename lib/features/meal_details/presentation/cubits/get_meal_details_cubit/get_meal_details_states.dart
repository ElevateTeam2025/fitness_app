import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';

sealed class GetMealDetailsStates {}

final class GetMealDetailsInitialState extends GetMealDetailsStates {}

final class GetMealDetailsLoadingState extends GetMealDetailsStates {}

final class GetMealDetailsSuccessState extends GetMealDetailsStates {
  final MealDetailsResponseEntity mealDetailsResponseEntity;
  GetMealDetailsSuccessState(this.mealDetailsResponseEntity);
}

final class GetMealDetailsErrorState extends GetMealDetailsStates {
  final String message;
  GetMealDetailsErrorState({required this.message});
}
