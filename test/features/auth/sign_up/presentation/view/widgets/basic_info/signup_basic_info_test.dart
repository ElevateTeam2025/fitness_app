import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/basic_info/signup_basic_info.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';

import 'signup_basic_info_test.mocks.dart';

@GenerateMocks([SignupCubit])
void main() {
  late MockSignupCubit mockCubit;

  setUp(() {
    mockCubit = MockSignupCubit();

      ScreenSizeService.width = 375;
      ScreenSizeService.height = 412;

    // Stub for stream and state:
    when(mockCubit.stream).thenAnswer((_) => Stream<SignupState>.empty());
    when(mockCubit.state).thenReturn(SignupState());

  });

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<SignupCubit>.value(
        value: mockCubit,
        child: Scaffold(body: SignupBasicInfo()),
      ),
    );
  }

  testWidgets('renders all input fields and register button', (tester) async {
    when(mockCubit.state).thenReturn(SignupState(
      firstName: '',
      lastName: '',
      email: '',
      password: '',
    ));

    await tester.pumpWidget(makeTestableWidget());

    expect(find.byKey(Key('firstNameField')), findsOneWidget);
    expect(find.byKey(Key('lastNameField')), findsOneWidget);
    expect(find.byKey(Key('emailField')), findsOneWidget);
    expect(find.byKey(Key('passwordField')), findsOneWidget);
    expect(find.byKey(Key('registerButton')), findsOneWidget);
  });

  testWidgets('register button disabled when form invalid', (tester) async {
    when(mockCubit.state).thenReturn(SignupState(
      firstName: '',
      lastName: '',
      email: 'invalid',
      password: '123',
    ));

    await tester.pumpWidget(makeTestableWidget());

    final button = tester.widget<ElevatedButton>(find.byKey(Key('registerButton')));
    expect(button.enabled, isFalse);
  });

  testWidgets('register button enabled when form valid', (tester) async {
    when(mockCubit.state).thenReturn(SignupState(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john@example.com',
      password: '123456',
    ));

    await tester.pumpWidget(makeTestableWidget());

    final button = tester.widget<ElevatedButton>(find.byKey(Key('registerButton')));
    expect(button.enabled, isTrue);
  });

  testWidgets('calls cubit.updateFirstName on first name input change', (tester) async {
    when(mockCubit.state).thenReturn(SignupState(
      firstName: '',
      lastName: '',
      email: '',
      password: '',
    ));

    await tester.pumpWidget(makeTestableWidget());

    await tester.enterText(find.byKey(Key('firstNameField')), 'John');
    verify(mockCubit.updateFirstName('John')).called(1);
  });
}
