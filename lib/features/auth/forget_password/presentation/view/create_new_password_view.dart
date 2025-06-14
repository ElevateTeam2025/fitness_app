import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/create_new_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<CreateNewPasswordCubit>(),
        child: CreateNewPasswordViewBody(
          email: email,
        ),
      ),
    );
  }
}
