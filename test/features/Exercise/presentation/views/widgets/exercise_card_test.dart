import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_card.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';

class FakeVideoDialog extends StatelessWidget {
  final String youtubeUrl;
  const FakeVideoDialog({Key? key, required this.youtubeUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Fake video dialog for URL: $youtubeUrl'),
    );
  }
}
void main() {
  setUp(() {
    // Setup screen size service mock
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;
  });
  // final exercise = Exercises(
  //   exercise: 'Push Up',
  //   posture: 'Standing',
  //   primeMoverMuscle: 'Chest',
  //   shortYoutubeDemonstrationLink: 'https://youtu.be/dQw4w9WgXcQ',
  // );

  testWidgets('ExerciseCard displays info correctly and opens video dialog on tap', (tester) async {
    final exercise = Exercises(
      exercise: 'Push Up',
      posture: 'Standing',
      primeMoverMuscle: 'Chest',
      shortYoutubeDemonstrationLink: 'https://youtu.be/dQw4w9WgXcQ',
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ExerciseCard(
          exercise: exercise,
          onTapOverride: () {
            showDialog(
              context: tester.element(find.byType(ExerciseCard)),
              builder: (_) => FakeVideoDialog(youtubeUrl: exercise.shortYoutubeDemonstrationLink!),
            );
          },
        ),
      ),
    ));

    expect(find.text('Push Up'), findsOneWidget);
    expect(find.text('Standing'), findsOneWidget);
    expect(find.text('Chest'), findsOneWidget);

    await tester.tap(find.byType(ExerciseCard));
    await tester.pumpAndSettle();

    expect(find.textContaining('Fake video dialog for URL'), findsOneWidget);
    expect(find.textContaining('dQw4w9WgXcQ'), findsOneWidget);
  });

  testWidgets('ExerciseCard does not open dialog when video link is empty', (WidgetTester tester) async {
    final exerciseNoVideo = Exercises(
      exercise: 'Squat',
      posture: 'Sitting',
      primeMoverMuscle: 'Legs',
      shortYoutubeDemonstrationLink: '',
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ExerciseCard(exercise: exerciseNoVideo),
      ),
    ));

    await tester.tap(find.byType(ExerciseCard));
    await tester.pumpAndSettle();

    expect(find.byType(Dialog), findsNothing);
  });
}
