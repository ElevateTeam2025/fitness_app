import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/extensions.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ForgetPasswordContentWidget extends StatefulWidget {
  const ForgetPasswordContentWidget({
    super.key,
    required this.onTap,
    required this.controller,
    required this.autovalidateMode,
    required this.formKey,
  });
  final VoidCallback onTap;
  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final GlobalKey<FormState> formKey;

  @override
  State<ForgetPasswordContentWidget> createState() =>
      _ForgetPasswordContentWidgetState();
}

class _ForgetPasswordContentWidgetState
    extends State<ForgetPasswordContentWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordCubit>();
    return CustomContainerWidget(
      body: [
        TextFormField(
          style: TextStyle(color: Colors.white),
          autovalidateMode: widget.autovalidateMode,
          onChanged: (value) {
            if (widget.formKey.currentState!.validate()) {
              setState(() {
                viewModel.autovalidateMode = AutovalidateMode.disabled;
              });
            } else {
              setState(() {
                viewModel.autovalidateMode = AutovalidateMode.always;
              });
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter email';
            } else if (value.isValidEmail == false) {
              return 'Please enter valid email';
            }
            return null;
          },
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.mail_outline, color: Color(0xffD3D3D3)),
          ),
        ),
        SizedBox(height: 24.HeightResponsive),
        BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
          listener: (context, state) {
            if (state is ForgetPasswordError) {
              EasyLoading.showError(state.message);
            } else if (state is ForgetPasswordLoading) {
              EasyLoading.show();
            } else if (state is ForgetPasswordSuccess) {
              EasyLoading.dismiss();
              Navigator.pushNamed(context, PagesRoutes.verifyResetCodeView);
            }
          },
          child: ElevatedButton(
            onPressed: widget.onTap,
            child: Text(
              'Send OTP',
              style: AppTextStyles.BalooThambi2_800_20.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
