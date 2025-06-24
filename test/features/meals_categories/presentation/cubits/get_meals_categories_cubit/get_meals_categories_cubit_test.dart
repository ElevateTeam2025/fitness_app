import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_categories_entity.dart';
import 'package:fitness_app/features/meals_categories/domain/repo/get_meals_categories_repo.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_states.dart';

import 'get_meals_categories_cubit_test.mocks.dart';

@GenerateMocks([GetMealsCategoriesRepo])
void main() {
  late MockGetMealsCategoriesRepo mockRepo;
  late GetMealsCategoriesCubit cubit;

  final fakeCategories = [
    MealsCategoriesEntity(
      idCategory: '1',
      strCategory: 'Beef',
      strCategoryThumb: 'thumb_url',
      strCategoryDescription: 'Beef dishes',
    ),
    MealsCategoriesEntity(
      idCategory: '2',
      strCategory: 'Chicken',
      strCategoryThumb: 'thumb_url2',
      strCategoryDescription: 'Chicken dishes',
    ),
  ];

  provideDummy<Result<List<MealsCategoriesEntity>>>(Success(fakeCategories));

  setUp(() {
    mockRepo = MockGetMealsCategoriesRepo();
    cubit = GetMealsCategoriesCubit(getMealsCategoriesRepo: mockRepo);
  });

  tearDown(() => cubit.close());

  group('GetMealsCategoriesCubit', () {
    blocTest<GetMealsCategoriesCubit, GetMealsCategoriesStates>(
      'emits [Loading, Success] when fetching categories succeeds',
      build: () {
        when(
          mockRepo.getMealsCategories(),
        ).thenAnswer((_) async => Success(fakeCategories));
        return cubit;
      },
      act: (cubit) => cubit.doIntents(OnClickGetMealsCategories()),
      expect: () => [
        isA<GetMealsCategoriesLoadingState>(),
        isA<GetMealsCategoriesSuccessState>().having(
          (s) => s.mealsCategoriesEntity,
          'categories',
          fakeCategories,
        ),
      ],
    );

    blocTest<GetMealsCategoriesCubit, GetMealsCategoriesStates>(
      'emits [Loading, Error] when fetching categories fails',
      build: () {
        when(
          mockRepo.getMealsCategories(),
        ).thenAnswer((_) async => Error('Network error'));
        return cubit;
      },
      act: (cubit) => cubit.doIntents(OnClickGetMealsCategories()),
      expect: () => [
        isA<GetMealsCategoriesLoadingState>(),
        isA<GetMealsCategoriesErrorState>().having(
          (s) => s.message,
          'message',
          contains('Network error'),
        ),
      ],
    );
  });
}
