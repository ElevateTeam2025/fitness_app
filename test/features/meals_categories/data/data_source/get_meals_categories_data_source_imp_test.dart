import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/api/meals_api_client.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_categories_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_categories_data_source_imp.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_model.dart';
import 'package:fitness_app/features/meals_categories/data/models/meal_categories_reponse.dart';

import 'get_meals_by_category_data_source_imp_test.mocks.dart';

// 👇 Generate the mock class
@GenerateMocks([MealsApiClient])
void main() {
  late GetMealsCategoriesDataSource dataSource;
  late MockMealsApiClient mockMealsApiClient;

  setUp(() {
    mockMealsApiClient = MockMealsApiClient();
    dataSource = GetMealsCategoriesDataSourceImp(
      mealsApiClient: mockMealsApiClient,
    );
  });

  group('GetMealsCategoriesDataSourceImp', () {
    test('returns MealCategoriesReponse when API call is successful', () async {
      // Arrange
      final expectedResponse = MealCategoriesReponse(
        mealCategoriesModel: [
          MealCategoriesModel(
            idCategory: '1',
            strCategory: 'Beef',
            strCategoryThumb: 'url',
            strCategoryDescription: 'desc',
          ),
        ],
      );

      when(
        mockMealsApiClient.getMealsCategories(),
      ).thenAnswer((_) async => expectedResponse);

      // Act
      final result = await dataSource.getMealsCategories();

      // Assert
      expect(result, equals(expectedResponse));
      verify(mockMealsApiClient.getMealsCategories()).called(1);
      verifyNoMoreInteractions(mockMealsApiClient);
    });

    test('throws Exception when API call fails', () async {
      // Arrange
      when(
        mockMealsApiClient.getMealsCategories(),
      ).thenThrow(Exception('API Error'));

      // Act & Assert
      expect(() => dataSource.getMealsCategories(), throwsA(isA<Exception>()));
      verify(mockMealsApiClient.getMealsCategories()).called(1);
      verifyNoMoreInteractions(mockMealsApiClient);
    });
  });
}
