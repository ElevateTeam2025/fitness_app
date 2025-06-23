import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fitness_app/generated/l10n.dart';

import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/presentation/views/exercise_screen.dart';
import 'package:fitness_app/features/Exercise/presentation/cubit/sign_in_cubit/exercise_state.dart';
import 'package:fitness_app/features/Exercise/presentation/cubit/sign_in_cubit/exercise_view_model.dart';

class MockExerciseViewModel extends MockCubit<ExerciseState> implements ExerciseViewModel {}

void main() {
  late MockExerciseViewModel mockViewModel;

  setUpAll(() {
    registerFallbackValue(LoadLevelsIntent());
    registerFallbackValue(LoadExercisesIntent('', ''));
  });

  setUp(() {
    mockViewModel = MockExerciseViewModel();

    when(() => mockViewModel.stream).thenAnswer((_) => const Stream<ExerciseState>.empty());
    when(() => mockViewModel.state).thenReturn(LoadingLevelsState());
    when(() => mockViewModel.doIntent(any())).thenReturn(null);

    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: BlocProvider<ExerciseViewModel>.value(
        value: mockViewModel,
        child: const ExercisesScreen(),
      ),
    );
  }

  testWidgets('Displays loading spinner initially', (tester) async {
    when(() => mockViewModel.state).thenReturn(LoadingLevelsState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Displays error message when levels loading fails', (tester) async {
    const errorMsg = 'Failed to load levels';
    when(() => mockViewModel.state).thenReturn(ErrorLevelsState(errorMsg));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text(errorMsg), findsOneWidget);
  });

  testWidgets('Displays tabs and exercises on successful load', (tester) async {
    final levels = [
      DifficultyLevelEntity(id: '1', name: 'beginner'),
      DifficultyLevelEntity(id: '2', name: 'intermediate'),
    ];

    final exercises = [
      Exercises(id: 'e1', exercise: 'Push Up', shortYoutubeDemonstrationLink: 'url1'),
      Exercises(id: 'e2', exercise: 'Squat', shortYoutubeDemonstrationLink: 'url2'),
    ];

    when(() => mockViewModel.state).thenReturn(SuccessLevelsState(levels));

    whenListen(
      mockViewModel,
      Stream.fromIterable([
        SuccessLevelsState(levels),
        LoadingExerciseState(),
        SuccessExerciseState(ExerciseResponseEntity(exercises: exercises)),
      ]),
      initialState: SuccessLevelsState(levels),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text('beginner'), findsOneWidget);
    expect(find.text('intermediate'), findsOneWidget);
    expect(find.text('Push Up'), findsOneWidget);
    expect(find.text('Squat'), findsOneWidget);
  });

  testWidgets('Tab changes trigger exercise loading', (tester) async {
    final levels = [
      DifficultyLevelEntity(id: '1', name: 'beginner'),
      DifficultyLevelEntity(id: '2', name: 'intermediate'),
    ];

    when(() => mockViewModel.state).thenReturn(SuccessLevelsState(levels));
    when(() => mockViewModel.doIntent(any())).thenReturn(null);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    await tester.tap(find.text('intermediate'));
    await tester.pumpAndSettle();

    verify(() => mockViewModel.doIntent(
      any(
        that: predicate<ExerciseIntent>((intent) =>
        intent is LoadExercisesIntent && intent.difficultyId == '2'),
      ),
    )).called(1);
  });
}
