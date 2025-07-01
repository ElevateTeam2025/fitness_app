import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/widgets.dart';

class EditProfileBackGroundImage extends StatelessWidget {
  const EditProfileBackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(ImageAssets.exerciseBackground, fit: BoxFit.cover),
    );
  }
}
