import 'dart:async';

import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/signup_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/basic_info/signup_basic_info.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/gender/signup_select_gender.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_age.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';

class MockSignupCubit extends Mock implements SignupCubit {}

void main() {
  late MockSignupCubit mockCubit;
  late StreamController<SignupState> controller;

  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
    controller = StreamController<SignupState>();
    mockCubit = MockSignupCubit();

    when(() => mockCubit.stream).thenAnswer((_) => controller.stream);
    when(() => mockCubit.previousStep()).thenReturn(null);
    when(() => mockCubit.nextStep()).thenReturn(null);
  });

  tearDown(() async {
    await controller.close();
  });

  testWidgets('renders SignupFlow and navigates through steps correctly', (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(SignupState(currentStep: 0));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SignupCubit>.value(
          value: mockCubit,
          child: const SignupFlow(),
        ),
      ),
    );

    expect(find.byType(SignupBasicInfo), findsOneWidget);
    expect(find.byType(SignupSelectGender), findsNothing);

    when(() => mockCubit.state).thenReturn(SignupState(currentStep: 1));
    controller.add(SignupState(currentStep: 1));
    await tester.pumpAndSettle(); // يكفي فقط

    expect(find.byType(SignupSelectGender), findsOneWidget);

    when(() => mockCubit.state).thenReturn(SignupState(currentStep: 2));
    controller.add(SignupState(currentStep: 2));
    await tester.pumpAndSettle();

    expect(find.byType(SignupSelectAge), findsOneWidget);
  });
}
