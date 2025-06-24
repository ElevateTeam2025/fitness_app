import 'package:fitness_app/core/api/meals_api_client.dart';
import 'package:fitness_app/features/meal_details/data/data_source/meal_details_remote_data_source.dart';
import 'package:fitness_app/features/meal_details/data/models/meal_details_reposonse_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MealDetailsRemoteDataSource)
class MealDetailsRemoteDataSourceImpl implements MealDetailsRemoteDataSource {
  final MealsApiClient _mealsApiClient;
  MealDetailsRemoteDataSourceImpl(this._mealsApiClient);

  @override
  Future<MealDetailsResponseDTO> getMealDetails(String id) {
    return _mealsApiClient.getMealDetails(id);
  }
}
