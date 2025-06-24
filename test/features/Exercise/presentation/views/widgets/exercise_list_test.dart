import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_list.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_card.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/shimmer_placeholder_widget.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  final testExercises = [
    Exercises(
      exercise: 'Push Up',
      posture: 'Keep back straight',
      primeMoverMuscle: 'Chest',
      shortYoutubeDemonstrationLink: 'https://youtu.be/dQw4w9WgXcQ',
    ),
    Exercises(
      exercise: 'Pull Up',
      posture: 'Pull yourself up',
      primeMoverMuscle: 'Back',
      shortYoutubeDemonstrationLink: 'https://youtu.be/dQw4w9WgXcQ',
    ),
  ];

  testWidgets('ExerciseList shows shimmer placeholders when loading', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExerciseList(
            exercises: [],
            isLoading: true,
          ),
        ),
      ),
    );

    expect(find.byType(ExerciseCard), findsNothing);
    expect(find.byType(ShimmerExerciseCardPlaceholder), findsNWidgets(6));
  });

  testWidgets('ExerciseList displays ExerciseCard widgets when loaded', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ExerciseList(
            exercises: testExercises,
            isLoading: false,
          ),
        ),
      ),
    );

    expect(find.byType(ExerciseCard), findsNWidgets(testExercises.length));

    expect(find.text('Push Up'), findsOneWidget);
    expect(find.text('Pull Up'), findsOneWidget);
  });

  testWidgets('ExerciseCard onTapOverride callback is triggered when tapped', (tester) async {
    bool tapped = false;

    final exerciseCard = ExerciseCard(
      exercise: testExercises.first,
      onTapOverride: () {
        tapped = true;
      },
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: exerciseCard,
        ),
      ),
    );

    await tester.tap(find.byType(ExerciseCard));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
