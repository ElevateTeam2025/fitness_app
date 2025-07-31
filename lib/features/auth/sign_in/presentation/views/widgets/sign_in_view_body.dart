import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../../core/widgets/custom_validate.dart';
import '../../../../../../generated/l10n.dart';
import '../../../domain/entity/sign_in_request.dart';
import '../../cubit/sign_in_cubit/sign_in_state.dart';
import '../../cubit/sign_in_cubit/sign_in_view_model.dart';
import 'sign_in_form.dart';
import 'sign_in_header.dart';

class SignInViewBody extends StatefulWidget {
  final SignInViewModel signInViewModel;

  const SignInViewBody({required this.signInViewModel, super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isFormValid = false;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode()..addListener(() => setState(() {}));
    passwordFocusNode = FocusNode()..addListener(() => setState(() {}));

    _emailController.addListener(validateForm);
    _passwordController.addListener(validateForm);
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void validateForm() {

    final emailValid = AppValidate.validateEmail(_emailController.text,context) == null;
    final passwordValid = AppValidate.validatePassword(_passwordController.text,context) == null;

    setState(() {
      isFormValid = emailValid && passwordValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewModel, SignInState>(
      bloc: widget.signInViewModel,
      listener: (context, state) {
        if (state is LoadingSignInState) {
          EasyLoading.show();
        } else if (state is SuccessSignInState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(S.of(context).successLogin);
          Navigator.pushReplacementNamed(context, PagesRoutes.layoutView);
        } else if (state is ErrorSignInState) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.message);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: responsiveHeight(32)),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignInHeader(),
                  SizedBox(height: responsiveHeight(24)),
                  CustomContainerWidget(
                    body: [
                      SignInForm(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        emailFocusNode: emailFocusNode,
                        passwordFocusNode: passwordFocusNode,
                        isPasswordVisible: isPasswordVisible,
                        isFormValid: isFormValid,
                        onPasswordVisibilityToggle: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        onSubmit: () {
                          final isValid = _formKey.currentState?.validate() ?? false;
                          if (isValid) {
                            final data = SignInRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            widget.signInViewModel
                                .doIntent(SignInClickedIntent(data));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
