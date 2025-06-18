import 'dart:developer';

import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ResendWidget extends StatelessWidget {
  const ResendWidget({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordCubit>();
    return Column(
      children: [
        Text(
          'didnt recieve verification code?',
          style: AppTextStyles.BalooThambi2_400_16.copyWith(
            color: Colors.white,
          ),
        ),
        BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
          listener: (context, state) {
            if (state is ForgetPasswordError) {
              EasyLoading.showError(state.message);
            } else if (state is ForgetPasswordLoading) {
              EasyLoading.show();
            } else if (state is ForgetPasswordSuccess) {
              EasyLoading.showSuccess('code sent successfully to your email');
              EasyLoading.dismiss();
            }
          },
          child: TextButton(
            style: ButtonStyle(
              visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),

            onPressed: () {
              viewModel.request.email = email;
              viewModel.doIntent(SendForgotPasswordIntent());
            },
            child: Text(
              'ResendCode?',
              style: AppTextStyles.BalooThambi2_400_16,
            ),
          ),
        ),
      ],
    );
  }
}
