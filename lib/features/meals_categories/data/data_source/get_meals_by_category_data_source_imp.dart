import 'package:fitness_app/core/api/meals_api_client.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_by_category_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetMealsByCategoryDataSource)
class GetMealsByCategoryDataSourceImp implements GetMealsByCategoryDataSource {
  final MealsApiClient _mealsApiClient;

  GetMealsByCategoryDataSourceImp({required MealsApiClient mealsApiClient})
    : _mealsApiClient = mealsApiClient;
  @override
  Future<MealsByCategoryResponse> getMealsByCategory(String category) async {
    return await _mealsApiClient.getMealsByCategory(category);
  }
}
