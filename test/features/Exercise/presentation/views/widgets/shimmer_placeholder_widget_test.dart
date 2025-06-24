import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/shimmer_placeholder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;

  });
  testWidgets('ShimmerExerciseCardPlaceholder renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShimmerExerciseCardPlaceholder(),
        ),
      ),
    );

    expect(find.byType(ShimmerExerciseCardPlaceholder), findsOneWidget);

    expect(find.byType(Shimmer), findsOneWidget);

    final containers = find.descendant(
      of: find.byType(Column),
      matching: find.byType(Container),
    );

    expect(containers, findsNWidgets(3));

    expect(
      find.byWidgetPredicate((widget) =>
      widget is Container &&
          widget.decoration is BoxDecoration &&
          (widget.decoration as BoxDecoration).borderRadius != null),
      findsOneWidget,
    );
  });
}
