import 'package:fitness_app/features/meal_details/data/models/meal_details_reposonse_dto.dart';

abstract class MealDetailsRemoteDataSource {
  Future<MealDetailsResponseDTO> getMealDetails(String id);
}
