import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_states.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_categories_cubit/get_meals_categories_states.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_categories_views_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'meals_categories_views_body_test.mocks.dart';

@GenerateMocks([GetMealsCategoriesCubit, GetMealsByCategoryCubit])
void main() {
  late MockGetMealsCategoriesCubit mockMealsCategoriesCubit;
  late MockGetMealsByCategoryCubit mockMealsByCategoryCubit;

  // Provide dummy fallback values for the states used in the test
  setUpAll(() {
    provideDummy<GetMealsCategoriesStates>(GetMealsCategoriesInitialState());
    provideDummy<GetMealsByCategoryStates>(GetMealsByCategoryInitialState());
  });

  setUp(() {
    mockMealsCategoriesCubit = MockGetMealsCategoriesCubit();
    mockMealsByCategoryCubit = MockGetMealsByCategoryCubit();

    when(mockMealsCategoriesCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockMealsByCategoryCubit.stream).thenAnswer((_) => const Stream.empty());

    when(mockMealsCategoriesCubit.state).thenReturn(GetMealsCategoriesInitialState());
    when(mockMealsByCategoryCubit.state).thenReturn(GetMealsByCategoryInitialState());

    when(mockMealsCategoriesCubit.doIntents(any)).thenAnswer((_) async {});
    when(mockMealsByCategoryCubit.doIntents(any, category: anyNamed('category')))
        .thenAnswer((_) async {});

    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<GetMealsCategoriesCubit>.value(value: mockMealsCategoriesCubit),
          BlocProvider<GetMealsByCategoryCubit>.value(value: mockMealsByCategoryCubit),
        ],
        child: const Scaffold(
          body: MealsCategoriesViewsBody(),
        ),
      ),
    );
  }

  testWidgets('MealsCategoriesViewsBody renders and triggers doIntents', (tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    expect(find.byType(MealsCategoriesViewsBody), findsOneWidget);
    verify(mockMealsCategoriesCubit.doIntents(any)).called(1);
  });
}
