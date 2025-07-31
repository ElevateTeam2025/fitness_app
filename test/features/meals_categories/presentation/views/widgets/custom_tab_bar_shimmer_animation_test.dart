import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/custom_tab_bar_shimmer_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    // Simulate a typical mobile screen
    ScreenSizeService.height = 812;
    ScreenSizeService.width = 375;
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: Scaffold(
        body: CustomTabBarShimmerAnimation(),
      ),
    );
  }

  testWidgets('should render 8 shimmer containers horizontally', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget());
    await tester.pumpAndSettle();

    // Check that the ListView exists
    expect(find.byType(ListView), findsOneWidget);

    // Check that 8 shimmer containers are rendered
    final shimmerContainers = find.byWidgetPredicate((widget) =>
        widget is Container &&
        widget.decoration is BoxDecoration &&
        (widget.decoration as BoxDecoration).borderRadius != null);

    expect(shimmerContainers, findsNWidgets(8));
  });
}
