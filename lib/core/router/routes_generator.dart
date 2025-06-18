import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/views/sign_in/sign_in_screen.dart';
// import 'layout/presentation/layout_screen.dart';


class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.signIn:
        return MaterialPageRoute(builder: (context) => SignInScreen(), settings: settings,);
      // case PagesRoutes.layoutView:
        // return MaterialPageRoute(builder: (context) => LayoutScreen(), settings: settings,);

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
