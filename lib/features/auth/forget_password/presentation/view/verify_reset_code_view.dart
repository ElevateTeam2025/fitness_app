import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/verify_reset_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<VerifyResetCodeCubit>(
            create: (context) => getIt.get<VerifyResetCodeCubit>(),
          ),
          BlocProvider<ForgetPasswordCubit>(
            create: (context) => getIt.get<ForgetPasswordCubit>(),
          ),
        ],
        child: VerifyResetCodeViewBody(email: email)),
    );
  }
}
