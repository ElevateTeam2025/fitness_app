import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meal_grid_view_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

void main() {
  setUp(() {
    // Mock screen size for responsive extensions
    ScreenSizeService.height = 800;
    ScreenSizeService.width = 400;
  });

  Widget buildTestableWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: MealGridViewShimmerLoading(),
      ),
    );
  }

  testWidgets('should render shimmer container with rounded corners',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget());
    await tester.pump(); // Start shimmer animation

    // Verify the Shimmer widget exists
    expect(find.byType(Shimmer), findsOneWidget);

    // Verify the rounded container exists inside a ClipRRect
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(Container), findsWidgets);
  });
}
