import 'package:dio/dio.dart';
import 'package:fitness_app/core/utils/end_points.dart';

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
  Future<HomeMealCategoriesReponse> getHomeMealsCategories();


}
