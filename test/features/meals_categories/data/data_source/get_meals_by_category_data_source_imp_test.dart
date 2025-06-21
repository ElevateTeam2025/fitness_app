import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:fitness_app/core/api/meals_api_client.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_by_category_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_by_category_data_source_imp.dart';
import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_response.dart';

import 'get_meals_by_category_data_source_imp_test.mocks.dart';

@GenerateMocks([MealsApiClient])

void main() {
  late GetMealsByCategoryDataSource dataSource;
  late MockMealsApiClient mockMealsApiClient;

  setUp(() {
    mockMealsApiClient = MockMealsApiClient();
    dataSource = GetMealsByCategoryDataSourceImp(mealsApiClient: mockMealsApiClient);
  });

  group('GetMealsByCategoryDataSourceImp', () {
    test('returns MealsByCategoryResponse when API call is successful', () async {
      // Arrange
      const category = 'Seafood';
      final expectedResponse = MealsByCategoryResponse( mealsByCategoryModel: []);

      when(mockMealsApiClient.getMealsByCategory(category))
          .thenAnswer((_) async => expectedResponse);

      // Act
      final result = await dataSource.getMealsByCategory(category);

      // Assert
      expect(result, equals(expectedResponse));
      verify(mockMealsApiClient.getMealsByCategory(category)).called(1);
      verifyNoMoreInteractions(mockMealsApiClient);
    });

    test('throws Exception when API call fails', () async {
      // Arrange
      const category = 'Beef';

      when(mockMealsApiClient.getMealsByCategory(category))
          .thenThrow(Exception('API Error'));

      // Act & Assert
      expect(() => dataSource.getMealsByCategory(category), throwsA(isA<Exception>()));
      verify(mockMealsApiClient.getMealsByCategory(category)).called(1);
      verifyNoMoreInteractions(mockMealsApiClient);
    });
  });
}
