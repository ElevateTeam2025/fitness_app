import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/create_new_password_cubit/create_new_password_states.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/create_new_password_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CreateNewPasswordBlocListenerElevatedButton extends StatelessWidget {
  const CreateNewPasswordBlocListenerElevatedButton({
    super.key,
    required this.viewModel,
    required this.widget,
  });

  final CreateNewPasswordCubit viewModel;
  final CreateNewPasswordContent widget;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNewPasswordCubit, CreateNewPasswordStates>(
      listener: (context, state) {
        if (state is CreateNewPasswordError) {
          EasyLoading.showError(state.message);
        } else if (state is CreateNewPasswordLoading) {
          EasyLoading.show();
        } else if (state is CreateNewPasswordSuccess) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, PagesRoutes.signIn);
        }
      },
      child: ElevatedButton(
        onPressed: () {
          viewModel.request.email = widget.email;
          viewModel.request.newPassword = widget.passwordController.text;
          viewModel.doIntent(ExecuteCreateNewPasswordIntent());
        },
        child: Text(
          'Done',
          style: AppTextStyles.BalooThambi2_800_14.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
