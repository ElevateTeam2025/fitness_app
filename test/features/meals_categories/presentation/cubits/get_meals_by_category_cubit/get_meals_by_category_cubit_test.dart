import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:fitness_app/features/meals_categories/domain/repo/get_meals_by_category_repo.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_states.dart';

import 'get_meals_by_category_cubit_test.mocks.dart';

@GenerateMocks([GetMealsByCategoryRepo])
void main() {
  late MockGetMealsByCategoryRepo mockRepo;
  late GetMealsByCategoryCubit cubit;

  final mealsList = [
    MealsByCategoryEntity(
      id: '1',
      idMeal: '234',
      strMealThumb: 'url4',
      strMeal: 'gooode meal',
    ),
    MealsByCategoryEntity(
      id: '2',
      idMeal: '567',
      strMealThumb: 'url5',
      strMeal: 'nice meal',
    ),
  ];

  provideDummy<Result<List<MealsByCategoryEntity>>>(Success(mealsList));

  setUp(() {
    mockRepo = MockGetMealsByCategoryRepo();
    cubit = GetMealsByCategoryCubit(mockRepo);
  });

  tearDown(() => cubit.close());

  group('GetMealsByCategoryCubit', () {
    blocTest<GetMealsByCategoryCubit, GetMealsByCategoryStates>(
      'emits [Loading, Success] when meals are fetched successfully',
      build: () {
        when(
          mockRepo.getMealsByCategory('Beef'),
        ).thenAnswer((_) async => Success(mealsList));
        return cubit;
      },
      act: (cubit) =>
          cubit.doIntents(OnClickGetMealsByCategoryIntent(), category: 'Beef'),
      expect: () => [
        isA<GetMealsByCategoryLoadingState>(),
        isA<GetMealsByCategorySuccessState>().having(
          (s) => s.mealsByCategoryEntity,
          'meals',
          mealsList,
        ),
      ],
    );

    blocTest<GetMealsByCategoryCubit, GetMealsByCategoryStates>(
      'emits [Loading, Error] when meals fetch fails',
      build: () {
        when(
          mockRepo.getMealsByCategory('Beef'),
        ).thenAnswer((_) async => Error('Something went wrong'));
        return cubit;
      },
      act: (cubit) =>
          cubit.doIntents(OnClickGetMealsByCategoryIntent(), category: 'Beef'),
      expect: () => [
        isA<GetMealsByCategoryLoadingState>(),
        isA<GetMealsByCategoryErrorState>().having(
          (s) => s.message,
          'message',
          'Something went wrong',
        ),
      ],
    );
  });
}
