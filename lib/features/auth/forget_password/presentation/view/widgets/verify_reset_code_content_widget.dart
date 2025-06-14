import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/verify_reset_code_cubit/verify_reset_code_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/verify_reset_code_cubit/verify_reset_code_states.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/pins_widget.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/resend_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class VerifyResetCodeContentWidget extends StatefulWidget {
  const VerifyResetCodeContentWidget({super.key});

  @override
  State<VerifyResetCodeContentWidget> createState() =>
      _VerifyResetCodeContentWidgetState();
}

class _VerifyResetCodeContentWidgetState
    extends State<VerifyResetCodeContentWidget> {
  @override
  Widget build(BuildContext context) {
    final VerifyResetCodeCubit viewModel = context.read<VerifyResetCodeCubit>();
    return CustomContainerWidget(
      body: [
        PinsWidget(
          autovalidateMode: viewModel.autovalidateMode,
          controller: viewModel.verifyResetCodeController,
        ),
        SizedBox(height: 24.HeightResponsive),
        BlocListener<VerifyResetCodeCubit, VerifyResetCodeStates>(
          listener: (context, state) {
            if (state is VerifyResetCodeError) {
              EasyLoading.showError(state.error);
            } else if (state is VerifyResetCodeLoading) {
              EasyLoading.show();
            } else if (state is VerifyResetCodeSuccess) {
              EasyLoading.dismiss();
              final String email = context
                  .read<ForgetPasswordCubit>()
                  .request
                  .email;
              Navigator.pushNamed(
                context,
                PagesRoutes.createNewPasswordView,
                arguments: email,
              );
            }
          },
          child: ElevatedButton(
            onPressed: () => sendOtpFun(context),
            child: Text(
              'Confirm',
              style: AppTextStyles.BalooThambi2_800_14.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        ResendWidget(),
      ],
    );
  }

  void sendOtpFun(BuildContext context) {
    final viewModel = context.read<VerifyResetCodeCubit>();
    if (viewModel.formKey.currentState!.validate()) {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.disabled;
      });

      viewModel.request.resetCode = viewModel.verifyResetCodeController.text;

      viewModel.doIntent(SendVerifyResetCodeIntent());
    } else {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
