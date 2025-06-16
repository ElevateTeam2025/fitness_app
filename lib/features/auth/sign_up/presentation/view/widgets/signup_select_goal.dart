import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'build_page_title.dart';

class SignupSelectGoal extends StatelessWidget {
  const SignupSelectGoal({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();
    return Column(
      children: [
        BuildPageTitle(title: "WHAT IS YOUR GOAL?",
          subTitle: "This Helps Us Create Your Personalized plan",),

      ],
    );
  }
}
