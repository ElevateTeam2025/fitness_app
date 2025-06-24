import 'package:fitness_app/features/meals_categories/data/repo_imp/get_meals_categories_repo_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_categories_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_reponse.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';
import 'package:fitness_app/core/common/result.dart';

import 'get_meals_categories_repo_imp_test.mocks.dart';

@GenerateMocks([GetMealsCategoriesDataSource])
void main() {
  late GetMealsCategoriesRepoImp repo;
  late MockGetMealsCategoriesDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockGetMealsCategoriesDataSource();
    repo = GetMealsCategoriesRepoImp(
      getMealsCategoriesDataSource: mockDataSource,
    );
  });

  group('GetMealsCategoriesRepoImp', () {
    test('should return Success when API call succeeds', () async {
      // Arrange
      final model = MealCategoriesModel(
        idCategory: '1',
        strCategory: 'Beef',
        strCategoryThumb: 'thumb_url',
        strCategoryDescription: 'desc',
      );
      final response = MealCategoriesReponse(mealCategoriesModel: [model]);
      final expectedEntity = response.toEntity();

      when(
        mockDataSource.getMealsCategories(),
      ).thenAnswer((_) async => response);

      // Act
      final result = await repo.getMealsCategories();

      // Assert
      expect(result, isA<Success<List<MealsCategoriesEntity>>>());
      final success = result as Success<List<MealsCategoriesEntity>>;

      // Compare field by field
      expect(success.data?.length, expectedEntity.length);
      for (int i = 0; i < expectedEntity.length; i++) {
        expect(success.data![i].idCategory, expectedEntity[i].idCategory);
        expect(success.data![i].strCategory, expectedEntity[i].strCategory);
        expect(
          success.data![i].strCategoryThumb,
          expectedEntity[i].strCategoryThumb,
        );
        expect(
          success.data![i].strCategoryDescription,
          expectedEntity[i].strCategoryDescription,
        );
      }

      verify(mockDataSource.getMealsCategories()).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return Error when exception is thrown', () async {
      // Arrange
      when(
        mockDataSource.getMealsCategories(),
      ).thenThrow(Exception('API Error'));

      // Act
      final result = await repo.getMealsCategories();

      // Assert
      expect(result, isA<Error<List<MealsCategoriesEntity>>>());
      final error = result as Error<List<MealsCategoriesEntity>>;
      expect(error.exception, contains('Exception'));

      verify(mockDataSource.getMealsCategories()).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
