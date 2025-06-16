import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/verify_reset_code_view.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/signup_flow.dart';
import 'package:flutter/material.dart';


class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.forgetPasswordView:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case PagesRoutes.verifyResetCodeView:
        return MaterialPageRoute(builder: (_) => const VerifyResetCodeView());
        case PagesRoutes.SignUpFlowView:
        // Assuming you have a SignUpFlowView, uncomment the line below
         return MaterialPageRoute(builder: (_) =>  SignupFlow());
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
