import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../cubit/signup_view_model_cubit.dart';
import '../build_page_title.dart';

class SignupBasicInfo extends StatelessWidget {
  const SignupBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var tr =S.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          final cubit = context.read<SignupCubit>();
          return Column(
            children: [
              BuildPageTitle(title: tr.heyThere, subTitle: tr.createAccount),
              CustomContainerWidget(
                body: [
                  Padding(
                    padding: EdgeInsets.all(16.heightResponsive),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // First Name TextField
                        TextField(
                          key: const Key('firstNameField'),
                          onChanged: (value) => cubit.updateFirstName(value),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline_sharp,
                              color: AppColors.whiteColor,
                            ),
                            hintText: "First Name",
                            errorText: state.firstNameError,
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.firstNameError != null
                                    ? Colors.red
                                    : state.isFirstNameValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.firstNameError != null
                                    ? Colors.red
                                    : state.isFirstNameValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.firstNameError != null
                                    ? Colors.red
                                    : state.isFirstNameValid
                                    ? Colors.green
                                    : AppColors.primaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          style: AppTextStyles.balooThambi2_400_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 16.heightResponsive),

                        // Last Name TextField
                        TextField(
                          key: const Key('lastNameField'),
                          onChanged: (value) => cubit.updateLastName(value),
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            prefixIcon: Icon(
                              Icons.person_outline_sharp,
                              color: AppColors.whiteColor,
                            ),
                            errorText: state.lastNameError,
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.lastNameError != null
                                    ? Colors.red
                                    : state.isLastNameValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.lastNameError != null
                                    ? Colors.red
                                    : state.isLastNameValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.lastNameError != null
                                    ? Colors.red
                                    : state.isLastNameValid
                                    ? Colors.green
                                    : AppColors.primaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          style: AppTextStyles.balooThambi2_400_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 16.heightResponsive),

                        // Email TextField
                        TextField(
                          key: const Key('emailField'),
                          onChanged: (value) => cubit.updateEmail(value),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: tr.email,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: AppColors.whiteColor,
                            ),
                            errorText: state.emailError,
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.emailError != null
                                    ? Colors.red
                                    : state.isEmailValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.emailError != null
                                    ? Colors.red
                                    : state.isEmailValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.emailError != null
                                    ? Colors.red
                                    : state.isEmailValid
                                    ? Colors.green
                                    : AppColors.primaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          style: AppTextStyles.balooThambi2_400_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 16.heightResponsive),

                        // Password TextField
                        TextField(
                          key: const Key('passwordField'),
                          obscureText: true,
                          onChanged: (value) => cubit.updatePassword(value),
                          decoration: InputDecoration(
                            hintText: tr.password,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: AppColors.whiteColor,
                            ),
                            errorText: state.passwordError,
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.passwordError != null
                                    ? Colors.red
                                    : state.isPasswordValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.passwordError != null
                                    ? Colors.red
                                    : state.isPasswordValid
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: state.passwordError != null
                                    ? Colors.red
                                    : state.isPasswordValid
                                    ? Colors.green
                                    : AppColors.primaryColor,
                                width: 2,
                              ),
                            ),
                          ),
                          style: AppTextStyles.balooThambi2_400_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 32.heightResponsive),

                        // Register Button
                        ElevatedButton(
                          key: const Key('registerButton'),
                          onPressed: state.isBasicInfoValid ? () => cubit.nextStep() : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: state.isBasicInfoValid
                                ? AppColors.primaryColor
                                : Colors.grey,
                            disabledBackgroundColor: Colors.grey.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            tr.register,
                            style: AppTextStyles.BalooThambi2_800_14.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        _aleadyHaveAccount(context)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _aleadyHaveAccount(BuildContext context) {
    var tr = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tr.alreadyHaveAccount,
          style: AppTextStyles.balooThambi2_400_14.copyWith(color: AppColors.whiteColor),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, PagesRoutes.signIn);
          },
          child: Text(
            tr.login,
            style: AppTextStyles.balooThambi2_400_14.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
              decorationThickness: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}