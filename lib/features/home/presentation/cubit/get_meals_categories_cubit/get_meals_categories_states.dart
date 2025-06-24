
part of  'get_meals_categories_cubit.dart';

sealed class GetHomeMealsCategoriesStates {}

final class GetHomeMealsCategoriesInitialState extends GetHomeMealsCategoriesStates {}

final class GetHomeMealsCategoriesLoadingState extends GetHomeMealsCategoriesStates {}

final class GetHomeMealsCategoriesSuccessState extends GetHomeMealsCategoriesStates {
  final List<HomeMealsCategoriesEntity> mealsCategoriesEntity;
  GetHomeMealsCategoriesSuccessState(this.mealsCategoriesEntity);
}

final class GetHomeMealsCategoriesErrorState extends GetHomeMealsCategoriesStates {
  final String message;
  GetHomeMealsCategoriesErrorState({required this.message});
}
