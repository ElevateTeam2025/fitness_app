import 'package:fitness_app/core/services/screen_size_service.dart';

extension HeightWidthResponsive on int {
  double get HeightResponsive {
    final screenHeight = ScreenSizeService.height;
    return (this / ScreenSizeService.baseHeight) * screenHeight;
  }

  double get WidthResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / ScreenSizeService.baseWidth) * screenWidth;
  }

  double get RadiusResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / 375.0) * screenWidth;
  }

  double get BorderResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / 375.0) * screenWidth;
  }

  double get FontSizeResponsive {
    final screenWidth = ScreenSizeService.width;
    return (this / ScreenSizeService.baseWidth) * screenWidth;
  }
}
