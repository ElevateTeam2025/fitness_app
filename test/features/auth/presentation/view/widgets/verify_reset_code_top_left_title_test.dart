import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/verify_reset_code_top_left_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('VerifyResetCodeTopLeftTitle displays correct texts', (WidgetTester tester) async {
    // Arrange: Build the widget inside a MaterialApp for proper rendering context
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VerifyResetCodeTopLeftTitle(),
        ),
      ),
    );

    // Assert: Verify the main and subtitle texts
    expect(find.text('OTP CODE'), findsOneWidget);
    expect(find.text('Enter Your OTP Check Your Email'), findsOneWidget);
  });
}
