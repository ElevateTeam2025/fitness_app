import 'package:fitness_app/app_view.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/feature/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:fitness_app/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case PagesRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
          settings: settings,
        );case PagesRoutes.appSection:
        return MaterialPageRoute(
          builder: (context) => const AppView(),
          settings: settings,
        );

      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}
