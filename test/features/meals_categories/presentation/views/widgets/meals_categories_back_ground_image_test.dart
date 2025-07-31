import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/widgets/meals_categories_back_ground_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MealsCategoriesBackGroundImage renders with correct asset and BoxFit.cover',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MealsCategoriesBackGroundImage(),
        ),
      ),
    );

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());

    final assetImage = imageWidget.image as AssetImage;
    expect(assetImage.assetName, ImageAssets.mealsCategoriesBackgroundImage);

    expect(imageWidget.fit, BoxFit.cover);

    final sizedBoxFinder = find.byType(SizedBox);
    expect(sizedBoxFinder, findsWidgets); // It may wrap it in SizedBox.expand
  });
}
