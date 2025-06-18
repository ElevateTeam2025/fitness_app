const String imagePath = "assets/images";
const String iconPath = "assets/icons";
const String animationPath = "assets/animations";
const String svgPath = "assets/svg";


abstract class ImageAssets {
  static const String logInBackground = "$imagePath/background.png";
  static const String logo = "$imagePath/logo.png";
}

abstract class AnimationAssets {
  static const String onboardingAssets = "$animationPath/onboarding_animation.json";
}

abstract class SvgImages {
  static const String logo = '$svgPath/logo.svg';

  static const String successApply = '$svgPath/success_apply.svg';
  static const String decoration1 = '$svgPath/decoration1.svg';
  static const String decoration2 = '$svgPath/decoration2.svg';
  static const String locationIcon = '$svgPath/location.svg';
  static const String whatsappIcon = '$svgPath/whats_app.svg';
  static const String callIcon = '$svgPath/call.svg';
  static const String errorIcon = '$svgPath/error.svg';
  static const String flowerImg = '$svgPath/flowerImg.svg';
}
