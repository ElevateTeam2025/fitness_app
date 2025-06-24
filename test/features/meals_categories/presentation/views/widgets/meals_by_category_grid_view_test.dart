import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_cubit.dart';
import 'package:fitness_app/features/meals_categories/presentation/cubits/get_meals_by_category_cubit/get_meals_by_category_states.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_by_category_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'meals_by_category_grid_view_test.mocks.dart';

@GenerateMocks([GetMealsByCategoryCubit])
void main() {
  late MockGetMealsByCategoryCubit mockCubit;

  // ✅ Provide dummy so mockito doesn't complain
  provideDummy<GetMealsByCategoryStates>(GetMealsByCategoryInitialState());

  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;

    mockCubit = MockGetMealsByCategoryCubit();
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockCubit.state).thenReturn(GetMealsByCategoryInitialState());
  });

  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: Size(375, 812)),
        child: BlocProvider<GetMealsByCategoryCubit>.value(
          value: mockCubit,
          child: Scaffold(body: child),
        ),
      ),
    );
  }

  testWidgets('shows loading shimmer when state is loading', (tester) async {
    when(mockCubit.state).thenReturn(GetMealsByCategoryLoadingState());

    await tester.pumpWidget(
      buildTestableWidget(const MealsByCategoryGridView()),
    );
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('shows meals grid when success', (tester) async {
    final meals = [
      MealsByCategoryEntity(
        idMeal: '101',
        strMeal: 'Pizza',
        strMealThumb:
            'https://assets.surlatable.com/m/15a89c2d9c6c1345/72_dpi_webp-REC-283110_Pizza.jpg',
      ),
      MealsByCategoryEntity(
        idMeal: '102',
        strMeal: 'Burger',
        strMealThumb:
            'https://assets.surlatable.com/m/15a89c2d9c6c1345/72_dpi_webp-REC-283110_Pizza.jpg',
      ),
    ];

    when(mockCubit.state).thenReturn(GetMealsByCategorySuccessState(meals));

    await tester.pumpWidget(
      buildTestableWidget(const MealsByCategoryGridView()),
    );
    expect(find.byType(GridView), findsOneWidget);
  });
}
