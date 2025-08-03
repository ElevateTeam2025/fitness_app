import 'package:fitness_app/core/services/screen_size_service.dart';

extension HeightWidthResponsive on int {
  double get heightResponsive {
    final screenHeight = ScreenSizeService.height;
    return (this / ScreenSizeService.baseHeight) * screenHeight;
  }

  double get widthResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / ScreenSizeService.baseWidth) * screenWidth;
  }

  double get radiusResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / 375.0) * screenWidth;
  }

  double get borderResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / 375.0) * screenWidth;
  }

  double get fontSizeResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / ScreenSizeService.baseWidth) * screenWidth;
  }
}
