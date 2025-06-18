import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_activity.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';

class MockSignupCubit extends Mock implements SignupCubit {}

void main() {
  late MockSignupCubit mockCubit;

  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;

    mockCubit = MockSignupCubit();

    // init status
    when(() => mockCubit.state).thenReturn(SignupState());

    whenListen(
      mockCubit,
      Stream.fromIterable([
        SignupState(),
        SignupState(selectedActivity: 'Intermediate'),
      ]),
    );

    when(() => mockCubit.selectActivity(any())).thenReturn(null);
    when(() => mockCubit.nextStep()).thenReturn(null);
  });

  testWidgets('selecting activity enables submit button and calls nextStep', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SignupCubit>.value(
          value: mockCubit,
          child:  Scaffold(body: SignupSelectActivity()),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('Intermediate'));
    await tester.pumpAndSettle();


    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    verify(() => mockCubit.selectActivity('Intermediate')).called(1);
    verify(() => mockCubit.nextStep()).called(1);
  });
}
