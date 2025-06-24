import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_response.dart';

abstract class GetMealsByCategoryDataSource {
  Future<MealsByCategoryResponse> getMealsByCategory(String category);
}
