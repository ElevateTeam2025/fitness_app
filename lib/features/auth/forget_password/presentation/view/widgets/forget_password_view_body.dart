import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/back_ground_image.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/forget_password_content_widget.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/forget_password_top_left_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordCubit>();
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
                  SizedBox(height: 96.heightResponsive),

                  ForgetPasswordTopLeftTitle(),

                  SizedBox(height: 16.heightResponsive),

                  ForgetPasswordContentWidget(
                    formKey: viewModel.formKey,
                    autovalidateMode: viewModel.autovalidateMode,
                    controller: viewModel.emailController,
                    onTap: _forgetPasswordFun,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _forgetPasswordFun() async {
    final viewModel = context.read<ForgetPasswordCubit>();
    if (viewModel.autovalidateMode == AutovalidateMode.always) {
      null;
    } else if (viewModel.formKey.currentState!.validate()) {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.disabled;
      });
      viewModel.request.email = viewModel.emailController.text;
      viewModel.doIntent(SendForgotPasswordIntent());
    } else {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}