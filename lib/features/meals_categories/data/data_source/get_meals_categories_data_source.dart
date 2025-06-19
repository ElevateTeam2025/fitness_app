import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_reponse.dart';

abstract class GetMealsCategoriesDataSource {
  Future<MealCategoriesReponse> getMealsCategories();
}
