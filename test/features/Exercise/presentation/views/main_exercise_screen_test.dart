import 'dart:async';

import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/presentation/cubit/sign_in_cubit/exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_it/get_it.dart';

import 'package:fitness_app/features/Exercise/presentation/cubit/sign_in_cubit/exercise_view_model.dart';
import 'package:fitness_app/features/Exercise/presentation/views/main_exercise_screen.dart';
import 'package:fitness_app/features/Exercise/presentation/views/exercise_screen.dart';

import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FakeLoadExercisesIntent extends Fake implements LoadExercisesIntent {
  FakeLoadExercisesIntent() : super();
}

class MockExerciseViewModel extends Mock implements ExerciseViewModel {}

void main() {
  late MockExerciseViewModel mockViewModel;
  late StreamController<ExerciseState> controller;

  setUpAll(() {
    registerFallbackValue(FakeLoadExercisesIntent());
  });

  setUp(() {
    mockViewModel = MockExerciseViewModel();
    controller = StreamController<ExerciseState>.broadcast();

    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;

    final getIt = GetIt.instance;

    if (getIt.isRegistered<ExerciseViewModel>()) {
      getIt.unregister<ExerciseViewModel>();
    }
    getIt.registerSingleton<ExerciseViewModel>(mockViewModel);

    when(() => mockViewModel.state).thenReturn(
      SuccessLevelsState([
        DifficultyLevelEntity(id: 'easy', name: 'Easy'),
        DifficultyLevelEntity(id: 'medium', name: 'Medium'),
      ]),
    );

    when(() => mockViewModel.stream).thenAnswer((_) => controller.stream);
    when(() => mockViewModel.doIntent(any())).thenReturn(null);

    // إضافة هذه السطر لمنع الخطأ المرتبط بدالة close()
    when(() => mockViewModel.close()).thenAnswer((_) async {});
  });

  tearDown(() {
    controller.close();
  });

  tearDownAll(() {
    GetIt.instance.reset();
  });

  Widget createTestWidget() {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const ExercisesWrapperScreen(),
    );
  }

  testWidgets('ExercisesWrapperScreen builds and shows ExercisesScreen', (tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pump();

    expect(find.byType(ExercisesWrapperScreen), findsOneWidget);
    expect(find.byType(ExercisesScreen), findsOneWidget);
  });
}

