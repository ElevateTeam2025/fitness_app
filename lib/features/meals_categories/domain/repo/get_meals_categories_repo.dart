import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';

abstract class  GetMealsCategoriesRepo {
  Future<Result<MealsCategoriesEntity>> getMealsCategories();
}
