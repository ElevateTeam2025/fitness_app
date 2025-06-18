import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onChange(value) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        validateMode = AutovalidateMode.disabled;
      });
    } else {
      setState(() {
        validateMode = AutovalidateMode.always;
      });
    }
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
          EasyLoading.showSuccess('success');
          Navigator.pushReplacementNamed(context, PagesRoutes.layoutView);
        } else if (state is ErrorSignInState) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.message);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              // horizontal: responsiveWidth(16),
              vertical: responsiveHeight(32),
            ),
            child: Form(
              autovalidateMode: validateMode,
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
                        validateMode: validateMode,
                        isPasswordVisible: isPasswordVisible,
                        onPasswordVisibilityToggle: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        onChange: onChange,
                        onSubmit: () {
                          if (validateMode == AutovalidateMode.always) return;

                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              validateMode = AutovalidateMode.disabled;
                            });
                            var data = SignInRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            widget.signInViewModel.doIntent(SignInClickedIntent(data));
                          } else {
                            setState(() {
                              validateMode = AutovalidateMode.always;
                            });
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
