import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/features/auth/change_password/presentation/veiw/change_password_screen.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/create_new_password_view.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/verify_reset_code_view.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/signup_flow.dart';
import 'package:fitness_app/app_view.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:fitness_app/features/meal_details/presentation/views/meal_details_view.dart';
import 'package:fitness_app/features/meals_categories/presentation/views/meals_categories_view.dart';
import 'package:fitness_app/features/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:fitness_app/features/splash/presentation/splash_screen.dart';
import 'package:fitness_app/features/worksout/presentation/view/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/Exercise/presentation/views/main_exercise_screen.dart';
import '../../features/auth/change_password/presentation/cubit/change_password_cubit/change_password_view-model.dart';
import '../../features/auth/sign_in/presentation/views/sign_in/sign_in_screen.dart';
import '../../features/chatbot/presentation/view/chatbot_tab.dart';
import '../../layout/presentation/layout_screen.dart';
import '../di/injectable_initializer.dart';

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
      case PagesRoutes.changePassword:
       return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
            create: (context) => getIt.get<ChangePasswordViewModel>(),
            child: ChangePasswordScreen(),
          ),
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
      case PagesRoutes.exerciseScreen:
        return MaterialPageRoute(
          builder: (_) => const WorkoutTab(),
          settings: settings,
        );
      case PagesRoutes.mealDetails:
        return MaterialPageRoute(
          builder: (_) => MealDetailsView(),
          settings: settings,
        );

      case PagesRoutes.createNewPasswordView:
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordView(),
          settings: settings,
        );

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
      case PagesRoutes.editProfile:
        return MaterialPageRoute(
          builder: (context) => EditProfileView(),
          settings: settings,
        );
      // case PagesRoutes.editProfileFields:
      //   return MaterialPageRoute(
      //     // builder: (context) =>  EditProfileFields(),
      //     settings: settings,
      //   );
      /////////////////////////////////////////////////
      /////////////////////////////////////////////////

      case PagesRoutes.exercisesWrapperScreen:
        return MaterialPageRoute(
          builder: (context) => ExercisesWrapperScreen(),
          settings: settings,
        );

      case PagesRoutes.chatPage:
        return MaterialPageRoute(builder: (_)=>ChatbotTab(),settings: settings);
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
