import 'package:fitness_app/core/api/meals_api_client.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_categories_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetMealsCategoriesDataSource)
class GetMealsCategoriesDataSourceImp implements GetMealsCategoriesDataSource {
  final MealsApiClient _mealsClient;

  GetMealsCategoriesDataSourceImp({required MealsApiClient mealsApiClient})
    : _mealsClient = mealsApiClient;
  @override
  Future<MealCategoriesModel> getMealsCategories() {
    return _mealsClient.getMealsCategories();
  }
}
