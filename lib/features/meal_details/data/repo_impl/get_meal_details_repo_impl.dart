import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meal_details/data/data_source/meal_details_remote_data_source.dart';
import 'package:fitness_app/features/meal_details/domain/entites/meal_details_response_entity.dart';
import 'package:fitness_app/features/meal_details/domain/repo/get_meal_deatils_repo.dart';

class GetMealDetailsRepoImpl implements GetMealDetailsRepo {
  final MealDetailsRemoteDataSource _mealDetailsRemoteDataSource;
  GetMealDetailsRepoImpl(this._mealDetailsRemoteDataSource);

  @override
  Future<Result<MealDetailsResponse>> getMealDetails(String id) async {
    return await executeApi<MealDetailsResponse>(() async {
      final response = await _mealDetailsRemoteDataSource.getMealDetails(id);
      return response.toEntity();
    });
  }
}
