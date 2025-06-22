import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';
import 'package:fitness_app/features/meal_details/domain/repo/get_meal_deatils_repo.dart';

class GetMealDetailsUseCase {
  final GetMealDetailsRepo _mealDetailsRepository;

  GetMealDetailsUseCase(this._mealDetailsRepository);

  Future<Result<MealDetailsResponse>> execute(String mealId) {
    return _mealDetailsRepository.getMealDetails(mealId);
  }
}
