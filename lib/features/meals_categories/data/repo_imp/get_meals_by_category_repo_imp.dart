import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_by_category_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_response.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:fitness_app/features/meals_categories/domain/repo/get_meals_by_category_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetMealsByCategoryRepo)
class GetMealsByCategoryRepoImp implements GetMealsByCategoryRepo {
  final GetMealsByCategoryDataSource _getMealsByCategoryDataSource;

  GetMealsByCategoryRepoImp({
    required GetMealsByCategoryDataSource getMealsByCategoryDataSource,
  }) : _getMealsByCategoryDataSource = getMealsByCategoryDataSource;
  @override
  Future<Result<List<MealsByCategoryEntity>>> getMealsByCategory(
    String category,
  ) async{
    return await executeApi<List<MealsByCategoryEntity>>(() async {
      final MealsByCategoryResponse response =
          await _getMealsByCategoryDataSource.getMealsByCategory(category);
      List<MealsByCategoryEntity> mealsByCategoryEntity = response.toEntity();
      return mealsByCategoryEntity;
    });
  }
}
