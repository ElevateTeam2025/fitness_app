import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/video_widget/youtube_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('YoutubeVideoPlayer displays fake player in test', (tester) async {

      ScreenSizeService.width = 375;
      ScreenSizeService.height = 412;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: YoutubeVideoPlayer(
            youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            youtubePlayer: Placeholder(),
          ),
        ),
      ),
    );

    expect(find.byType(Placeholder), findsOneWidget);

    expect(find.byType(AspectRatio), findsOneWidget);
  });
}
