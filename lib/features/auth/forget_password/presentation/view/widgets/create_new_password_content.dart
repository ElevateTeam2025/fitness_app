import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/extensions.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/create_new_password_bloc_listener_elevated_button.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/create_new_password_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordContent extends StatefulWidget {
  const CreateNewPasswordContent({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.email,
  });

  final String email;

  final TextEditingController passwordController;

  final TextEditingController confirmPasswordController;

  @override
  State<CreateNewPasswordContent> createState() =>
      _CreateNewPasswordContentState();
}

class _CreateNewPasswordContentState extends State<CreateNewPasswordContent> {
  @override
  Widget build(BuildContext context) {
    final CreateNewPasswordCubit viewModel = context
        .read<CreateNewPasswordCubit>();
    bool isPasswordVisible = viewModel.isPasswordVisible;
    return CustomContainerWidget(
      body: [
        CreateNewPasswordCustomPasswordTextField(
          onChange: (value) {
            _onChangeFun(viewModel);
          },
          controller: widget.passwordController,
          hintText: 'Password',
          validator: passwordValidatorFun,
          isPasswordVisible: isPasswordVisible,
          onToggleVisibility: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
              viewModel.isPasswordVisible = isPasswordVisible;
            });
          },
          autovalidateMode: viewModel.autovalidateMode,
        ),
        SizedBox(height: 24.HeightResponsive),

        CreateNewPasswordCustomPasswordTextField(
          onChange: (value) {
            _onChangeFun(viewModel);
          },
          controller: widget.confirmPasswordController,
          hintText: 'Confirm Password',
          validator: confirmPasswordValidatorFun,
          isPasswordVisible: isPasswordVisible,
          onToggleVisibility: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
              viewModel.isPasswordVisible = isPasswordVisible;
            });
          },
          autovalidateMode: viewModel.autovalidateMode,
        ),
        SizedBox(height: 24.HeightResponsive),

        CreateNewPasswordBlocListenerElevatedButton(
          viewModel: viewModel,
          widget: widget,
        ),
      ],
    );
  }

  void _onChangeFun(CreateNewPasswordCubit viewModel) {
    if (viewModel.formKey.currentState!.validate()) {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.disabled;
      });
    } else {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  IconData checkVisiblity(bool isPasswordVisible) {
    return isPasswordVisible
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined;
  }

  String? confirmPasswordValidatorFun(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    } else if (value != widget.passwordController.text) {
      return 'Password does not match';
    }
    return null;
  }

  String? passwordValidatorFun(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else if (value.isValidPassword == false) {
      return 'Please enter a valid password';
    }
    return null;
  }
}
