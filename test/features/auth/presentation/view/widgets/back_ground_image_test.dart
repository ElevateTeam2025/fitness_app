import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/back_ground_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders BackGroudImage with correct asset', (WidgetTester tester) async {
    // Load the widget inside MaterialApp to handle asset/image context
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BackGroudImage(),
        ),
      ),
    );

    // Verify that Image.asset is present
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final image = tester.widget<Image>(imageFinder);
    expect((image.image as AssetImage).assetName, 'assets/images/main_back_ground.png');
    expect(image.fit, BoxFit.cover);
  });
}
