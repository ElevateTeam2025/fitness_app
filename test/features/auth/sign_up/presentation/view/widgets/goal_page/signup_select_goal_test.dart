import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/goal_page/signup_select_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock Cubit class
class MockSignupCubit extends Mock implements SignupCubit {}

void main() {
  late MockSignupCubit mockCubit;

  setUp(() {

    mockCubit = MockSignupCubit();
    ScreenSizeService.width = 800;
    ScreenSizeService.height = 600;
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: Size(800, 600)),
        child: BlocProvider<SignupCubit>.value(
          value: mockCubit,
          child: SignupSelectGoal(),
        ),
      ),
    );
  }

  testWidgets('Initial state disables Next button and shows all goals', (tester) async {
    // Arrange: stub the cubit stream and state
    when(() => mockCubit.state).thenReturn( SignupState(selectedGoal: ''));
    whenListen(mockCubit, Stream.value( SignupState(selectedGoal: '')));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Assert
    // Check all goal texts present
    expect(find.text('Gain weight'), findsOneWidget);
    expect(find.text('lose weight'), findsOneWidget);
    expect(find.text('Get fitter'), findsOneWidget);
    expect(find.text('Gain more flexible'), findsOneWidget);
    expect(find.text('Learn the basic'), findsOneWidget);

    // Next button is disabled
    final nextButton = tester.widget<ElevatedButton>(find.widgetWithText(ElevatedButton, 'Next'));
    expect(nextButton.onPressed, null);
  });

  testWidgets('Selecting a goal enables Next button and calls selectGoal', (tester) async {
    // Arrange initial state no selection
    when(() => mockCubit.state).thenReturn( SignupState(selectedGoal: ''));
    whenListen(mockCubit, Stream.value( SignupState(selectedGoal: '')));

    // Mock selectGoal method
    when(() => mockCubit.selectGoal(any())).thenAnswer((_) async {});

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Tap on "Get fitter"
    await tester.tap(find.text('Get fitter'));
    await tester.pump();

    // Verify selectGoal called with "Get fitter"
    verify(() => mockCubit.selectGoal('Get fitter')).called(1);
  });

  testWidgets('With a selected goal Next button is enabled and calls nextStep', (tester) async {
    // Arrange state with a selected goal
    when(() => mockCubit.state).thenReturn( SignupState(selectedGoal: 'Gain weight'));
    whenListen(mockCubit, Stream.value( SignupState(selectedGoal: 'Gain weight')));

    // Mock nextStep method
    when(() => mockCubit.nextStep()).thenAnswer((_) async {});

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Next button enabled
    final nextButtonFinder = find.widgetWithText(ElevatedButton, 'Next');
    final nextButton = tester.widget<ElevatedButton>(nextButtonFinder);
    expect(nextButton.onPressed, isNotNull);

    // Tap Next button
    await tester.tap(nextButtonFinder);
    await tester.pump();

    // Verify nextStep called once
    verify(() => mockCubit.nextStep()).called(1);
  });
}
