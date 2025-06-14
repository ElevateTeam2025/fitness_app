import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ForgetPasswordCubit>(
        create: (context) => getIt.get<ForgetPasswordCubit>(),
        child: const ForgetPasswordViewBody(),
      ),
    );
  }
}
