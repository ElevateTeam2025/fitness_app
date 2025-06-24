import 'package:fitness_app/features/meals_categories/domain/entities/meals_by_category_entity.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meal_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('MealGridViewItem displays meal title and image',
      (WidgetTester tester) async {
    final testMeal = MealsByCategoryEntity(
      idMeal: '12345',
      strMeal: 'Test Pizza',
      strMealThumb: 'https://example.com/test-pizza.jpg',
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(
              size: Size(375, 812), // iPhone X size for example
            ),
            child: Scaffold(
              body: MealGridViewItem(meal: testMeal),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // ✅ Check that the meal title appears
      expect(find.text('Test Pizza'), findsOneWidget);

      // ✅ Check NetworkImage usage
      final imageFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is NetworkImage &&
            (widget.image as NetworkImage).url == testMeal.strMealThumb,
      );
      expect(imageFinder, findsOneWidget);
    });
  });
}
