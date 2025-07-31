import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/widgets.dart';

class ChangePasswordBackGroundImage extends StatelessWidget {
  const ChangePasswordBackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        ImageAssets.logInBackground,
        fit: BoxFit.cover,
      ),
    );
  }
}