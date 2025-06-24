import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    // Provide dummy screen size for responsive widgets
    ScreenSizeService.height = 812;
    ScreenSizeService.width = 375;
  });

  testWidgets('MealsCustomAppBar renders and triggers Navigator.pop on tap',
      (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return const MealsCustomAppBar();
            },
          ),
        ),
      ),
    );

    // Check if the text is rendered
    expect(find.text('Food Recommendation'), findsOneWidget);

    // Now push a dummy page to test Navigator.pop
    navigatorKey.currentState!.push(MaterialPageRoute(
      builder: (_) => Scaffold(
        body: const MealsCustomAppBar(),
      ),
    ));
    await tester.pumpAndSettle();

    // Tap the back button (wrap with GestureDetector and key)
    await tester.tap(find.byWidgetPredicate((widget) =>
        widget is GestureDetector &&
        widget.key == const Key('backButton')));
    await tester.pumpAndSettle();

    // Check if pop worked
    expect(navigatorKey.currentState!.canPop(), isFalse);
  });
}
