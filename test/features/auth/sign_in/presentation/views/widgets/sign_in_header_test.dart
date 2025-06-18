import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/views/widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignInHeader UI Test', (WidgetTester tester) async {
    // Wrap in MaterialApp + Builder to get context
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            // Initialize the screen size
            ScreenSizeService.init(context);
            return const Scaffold(
              body: SignInHeader(),
            );
          },
        ),
      ),
    );

    await tester.pumpAndSettle();


    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Hey There'), findsOneWidget);
    expect(find.text('WELCOME BACK'), findsOneWidget);
  });
}

