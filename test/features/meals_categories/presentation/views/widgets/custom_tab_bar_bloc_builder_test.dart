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

@GenerateMocks([
  GetMealsCategoriesCubit,
  GetMealsByCategoryCubit,
])
void main() {
  late MockGetMealsCategoriesCubit mockCategoriesCubit;
  late MockGetMealsByCategoryCubit mockMealsCubit;

  setUpAll(() {
    // Provide dummy fallback values
    provideDummy<GetMealsCategoriesStates>(GetMealsCategoriesInitialState());
    provideDummy<GetMealsByCategoryStates>(GetMealsByCategoryInitialState());
  });

  setUp(() {
    mockCategoriesCubit = MockGetMealsCategoriesCubit();
    mockMealsCubit = MockGetMealsByCategoryCubit();

    // Basic fallback values for stream and state
    when(mockCategoriesCubit.state).thenReturn(GetMealsCategoriesInitialState());
    when(mockCategoriesCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockMealsCubit.state).thenReturn(GetMealsByCategoryInitialState());
    when(mockMealsCubit.stream).thenAnswer((_) => const Stream.empty());

    // Avoid null dereferencing on named parameters
    when(
      mockMealsCubit.doIntents(
        any,
        category: anyNamed('category'),
      ),
    ).thenAnswer((_) async {});
  });

  Widget createWidgetUnderTest() {
    ScreenSizeService.height = 800;
    ScreenSizeService.width = 400;

    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<GetMealsCategoriesCubit>.value(value: mockCategoriesCubit),
          BlocProvider<GetMealsByCategoryCubit>.value(value: mockMealsCubit),
        ],
        child: const Scaffold(
          body: MealsCategoriesViewsBody(),
        ),
      ),
    );
  }

  testWidgets('renders MealsCategoriesViewsBody without error', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(MealsCategoriesViewsBody), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
