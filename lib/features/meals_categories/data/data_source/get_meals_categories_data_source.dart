import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';

abstract class GetMealsCategoriesDataSource {
  Future<MealCategoriesModel> getMealsCategories();
}
