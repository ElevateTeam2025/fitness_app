import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_categories_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_reponse.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';
import 'package:fitness_app/features/meals_categories/domain/repo/get_meals_categories_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetMealsCategoriesRepo)
class GetMealsCategoriesRepoImp implements GetMealsCategoriesRepo {
  final GetMealsCategoriesDataSource _getMealsCategoriesDataSource;

  GetMealsCategoriesRepoImp({
    required GetMealsCategoriesDataSource getMealsCategoriesDataSource,
  }) : _getMealsCategoriesDataSource = getMealsCategoriesDataSource;

  @override
  Future<Result<List<MealsCategoriesEntity>>> getMealsCategories() async {
    return await executeApi<List<MealsCategoriesEntity>>(() async {
      final MealCategoriesReponse response = await _getMealsCategoriesDataSource
          .getMealsCategories();
      List<MealsCategoriesEntity> mealsCategoriesEntity = response.toEntity();
      return mealsCategoriesEntity;
    });
  }
}
