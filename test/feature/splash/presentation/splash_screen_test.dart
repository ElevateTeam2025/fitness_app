import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Splash screen', () {
    testWidgets('Check if the image is rendered', (tester) async {
        await tester.runAsync(() async {
          await Future.delayed(Duration(seconds: 5));
        });
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SplashScreen(),
            ),
          ),
        );

        // Find the image by asset
        final imageFinder = find.image(AssetImage(ImageAssets.bgImage));
        expect(imageFinder, findsOneWidget);


    });
  });
}
