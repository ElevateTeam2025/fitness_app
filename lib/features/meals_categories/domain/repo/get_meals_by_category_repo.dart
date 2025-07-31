import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';

abstract class GetMealsByCategoryRepo {
  Future<Result<List<MealsByCategoryEntity>>> getMealsByCategory(
    String category,
  );
}
