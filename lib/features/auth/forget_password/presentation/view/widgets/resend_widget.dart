
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../../generated/l10n.dart';

class ResendWidget extends StatelessWidget {
  const ResendWidget({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordCubit>();
    return Column(
      children: [
        Text(
          S.of(context).didNotReceiveVerificationCode,
          style: AppTextStyles.balooThambi2_400_16.copyWith(
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
              EasyLoading.showSuccess(S.of(context).codeSentSuccessfullyToYourEmail);
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
              S.of(context).resendCode,
              style: AppTextStyles.balooThambi2_400_16,
            ),
          ),
        ),
      ],
    );
  }
}
