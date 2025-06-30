import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/end_points.dart';
import 'package:fitness_app/features/meal_details/data/models/meal_details_reposonse_dto.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_reponse.dart';
import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_response.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/home/data/model/meal_categories_reponse.dart';
part 'meals_api_client.g.dart';

@RestApi(baseUrl: mealsBaseUrl)
@singleton
@injectable
abstract class MealsApiClient {
  @factoryMethod
  factory MealsApiClient(Dio dio) = _MealsApiClient;

  @GET(ApiEndPoints.mealsCategories)
  Future<MealCategoriesReponse> getMealsCategories();
  @GET(ApiEndPoints.mealsCategories)
  Future<HomeMealCategoriesReponse> getHomeMealsCategories();


  @GET(ApiEndPoints.mealsByCategory)
  Future<MealsByCategoryResponse> getMealsByCategory(
    @Query("c") String category,
  );

  @GET(ApiEndPoints.mealDetails)
  Future<MealDetailsResponseDTO> getMealDetails(@Query("i") String id);
}
