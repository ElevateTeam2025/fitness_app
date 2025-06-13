import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/verify_reset_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<VerifyResetCodeCubit>(),
        child: const VerifyResetCodeViewBody(),
      ),
    );
  }
}
