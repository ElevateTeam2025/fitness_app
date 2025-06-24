import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/video_widget/video_draggable_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('VideoDraggableDialog displays and reacts correctly', (tester) async {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (_) => VideoDraggableDialog(
                      youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                      youtubePlayer: Placeholder(), // Fake widget
                    ),
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byIcon(AppIcons.openYoutube), findsOneWidget);
    expect(find.byIcon(AppIcons.closeIcon), findsOneWidget);

    await tester.tap(find.byIcon(AppIcons.closeIcon), warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.byType(VideoDraggableDialog), findsNothing);
  });
}
