import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/back_ground_image.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/create_new_password_content.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/create_new_password_top_left_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final CreateNewPasswordCubit viewModel = context
        .read<CreateNewPasswordCubit>();
    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autovalidateMode,
      child: Stack(
        children: [
          BackGroudImage(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 46.heightResponsive),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset('assets/images/app_logo.png')),
                  SizedBox(height: 58.heightResponsive),
                  CreateNewPasswordTopLeftTitle(),
                  SizedBox(height: 16.heightResponsive),
                  CreateNewPasswordContent(
                   
                    email: email,
                    confirmPasswordController:
                        viewModel.confirmPasswordController,
                    passwordController: viewModel.passwordController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
