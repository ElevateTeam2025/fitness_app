import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/widgets.dart';

class MealsCategoriesBackGroundImage extends StatelessWidget {
  const MealsCategoriesBackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        ImageAssets.mealsCategoriesBackgroundImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
