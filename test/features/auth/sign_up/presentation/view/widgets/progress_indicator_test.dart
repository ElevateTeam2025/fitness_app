import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('CustomCircularProgressIndicator displays correct progress and text', (WidgetTester tester)
  async {
    const int currentStep = 3;
    const int totalSteps = 5;
    const double size = 100.0;
    const double strokeWidth = 10.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: CustomCircularProgressIndicator(
              currentStep: currentStep,
              totalSteps: totalSteps,
              size: size,
              strokeWidth: strokeWidth,
            ),
          ),
        ),
      ),
    );

    expect(find.text('$currentStep/$totalSteps'), findsOneWidget);

    final customProgressFinder = find.descendant(
      of: find.byType(CustomCircularProgressIndicator),
      matching: find.byType(CustomPaint),
    );

    expect(customProgressFinder, findsNWidgets(2));

    final textWidget = tester.widget<Text>(find.text('$currentStep/$totalSteps'));
    expect(textWidget.style?.color, AppColors.whiteColor);
  });
}
