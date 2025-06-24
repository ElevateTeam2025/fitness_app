import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/create_new_password_view.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/verify_reset_code_view.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/signup_flow.dart';
import 'package:fitness_app/app_view.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/meals_categories_view.dart';
import 'package:fitness_app/features/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:fitness_app/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/sign_in/presentation/views/sign_in/sign_in_screen.dart';
import '../../layout/presentation/layout_screen.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
          settings: settings,
        );
      case PagesRoutes.layoutView:
        return MaterialPageRoute(
          builder: (context) => LayoutScreen(),
          settings: settings,
        );

      case PagesRoutes.forgetPasswordView:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordView(),
          settings: settings,
        );
      case PagesRoutes.verifyResetCodeView:
        return MaterialPageRoute(
          builder: (_) => const VerifyResetCodeView(),
          settings: settings,
        );
      case PagesRoutes.mealsCategories:
        return MaterialPageRoute(
          builder: (_) => const MealsCategoriesView(),
          settings: settings,
        );

      case PagesRoutes.createNewPasswordView:
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordView(),
          settings: settings,
        );

      case PagesRoutes.signUpFlowView:
        case PagesRoutes.signUpFlowView:
        // Assuming you have a SignUpFlowView, uncomment the line below
        return MaterialPageRoute(builder: (_) => SignupFlow());
      case PagesRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case PagesRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
          settings: settings,
        );
      case PagesRoutes.appSection:
        return MaterialPageRoute(
          builder: (context) => const AppView(),
          settings: settings,
        );

/////////////////////////////////////////////////
/////////////////////////////////////////////////


      case PagesRoutes.exercisesWrapperScreen:
        return MaterialPageRoute(builder: (context) => ExercisesWrapperScreen(), settings: settings,);


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
