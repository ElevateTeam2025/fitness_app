

import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/back_ground_image.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/verify_reset_code_content_widget.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/verify_reset_code_top_left_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyResetCodeViewBody extends StatelessWidget {
  const VerifyResetCodeViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    context.read<ForgetPasswordCubit>().request.email = email;
    final VerifyResetCodeCubit viewModel = context.read<VerifyResetCodeCubit>();

    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autovalidateMode,
      child: Stack(
        children: [
          BackGroudImage(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 46.HeightResponsive),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset('assets/images/app_logo.png')),

                  SizedBox(height: 70.HeightResponsive),

                  VerifyResetCodeTopLeftTitle(),

                  SizedBox(height: 80.HeightResponsive),

                  VerifyResetCodeContentWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
