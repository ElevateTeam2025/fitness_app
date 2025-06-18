import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_height.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';

void main() {
  late SignupCubit signupCubit;

  setUp(() {
    ScreenSizeService.width = 400;
    ScreenSizeService.height = 800;

    signupCubit = SignupCubit();
  });

  tearDown(() {
    signupCubit.close();
  });

  testWidgets('renders title, subtitle, wheel widget and next button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SignupCubit>.value(
          value: signupCubit,
          child: Scaffold(
            body: SignupSelectHeight(),
          ),
        ),
      ),
    );

    expect(find.text('WHAT IS YOU HEIGHT ?'), findsOneWidget);
    expect(find.text('This Helps Us Create Your Personalized plan'), findsOneWidget);
    expect(find.text('CM'), findsOneWidget);

    final nextButton = find.widgetWithText(ElevatedButton, 'Next');
    expect(nextButton, findsOneWidget);

    final ElevatedButton buttonWidget = tester.widget(nextButton);
    expect(buttonWidget.onPressed, isNotNull);
  });

  testWidgets('changing wheel value updates cubit state and pressing next calls nextStep', (WidgetTester tester) async {
    bool nextStepCalled = false;

    signupCubit.stream.listen((state) {
      nextStepCalled = true;
    });

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SignupCubit>.value(
          value: signupCubit,
          child: Scaffold(
            body: SignupSelectHeight(),
          ),
        ),
      ),
    );

    final wheelFinder = find.text('CM');
    expect(wheelFinder, findsOneWidget);

    final nextButton = find.widgetWithText(ElevatedButton, 'Next');
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    expect(nextStepCalled, true);
  });
}
