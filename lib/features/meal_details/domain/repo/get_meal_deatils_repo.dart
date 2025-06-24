import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';

abstract class GetMealDetailsRepo {
  Future<Result<MealDetailsResponse>> getMealDetails(String id);
}
