import 'package:fitness_app/features/meals_categories/data/repo_imp/get_meals_by_category_repo_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/features/meals_categories/data/data_source/get_meals_by_category_data_source.dart';
import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_model.dart';
import 'package:fitness_app/features/meals_categories/data/models/meals_by_category_response.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:fitness_app/core/common/result.dart';
import 'get_meals_by_category_repo_imp_test.mocks.dart';

@GenerateMocks([GetMealsByCategoryDataSource])
void main() {
  late GetMealsByCategoryRepoImp repo;
  late MockGetMealsByCategoryDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockGetMealsByCategoryDataSource();
    repo = GetMealsByCategoryRepoImp(
      getMealsByCategoryDataSource: mockDataSource,
    );
  });

  group('GetMealsByCategoryRepoImp', () {
    const category = 'Beef';

    test('should return Success result when API call is successful', () async {
      // Arrange
      final response = MealsByCategoryResponse(
        mealsByCategoryModel: [
          MealsByCategoryModel(
            idMeal: '1',
            strMeal: 'Beef Stew',
            strMealThumb: 'url',
          ),
        ],
      );
      final expectedEntity = response.toEntity();

      when(
        mockDataSource.getMealsByCategory(category),
      ).thenAnswer((_) async => response);

      // Act
      final result = await repo.getMealsByCategory(category);

      // Assert
      expect(result, isA<Success<List<MealsByCategoryEntity>>>());

      final success = result as Success<List<MealsByCategoryEntity>>;
      final actual = success.data!;
      final expected = expectedEntity;


      expect(actual.length, expected.length);
      for (int i = 0; i < actual.length; i++) {
        expect(actual[i].idMeal, expected[i].idMeal);
        expect(actual[i].strMeal, expected[i].strMeal);
        expect(actual[i].strMealThumb, expected[i].strMealThumb);
      }

      verify(mockDataSource.getMealsByCategory(category)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return Error result when exception occurs', () async {
      // Arrange
      when(
        mockDataSource.getMealsByCategory(category),
      ).thenThrow(Exception('API error'));

      // Act
      final result = await repo.getMealsByCategory(category);

      // Assert
      expect(result, isA<Error<List<MealsByCategoryEntity>>>());
      final error = result as Error<List<MealsByCategoryEntity>>;
      expect(error.exception, isNotNull);
      expect(error.exception, contains('Exception'));

      verify(mockDataSource.getMealsByCategory(category)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
