import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_validate.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final VoidCallback onPasswordVisibilityToggle;
  final VoidCallback onSubmit;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final bool isFormValid;

  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.onPasswordVisibilityToggle,
    required this.onSubmit,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.isFormValid,
  });

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Column(
      children: [
        Text(
          tr.login,
          style: AppTextStyles.BalooThambi2_700_20.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(height: responsiveHeight(8)),
        TextFormField(
          key: const Key('emailField'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => AppValidate.validateEmail(value, context),
          focusNode: emailFocusNode,
          controller: emailController,
          style: AppTextStyles.BalooThambi2_500_16.copyWith(
            color: AppColors.whiteColor,
          ),
          decoration: InputDecoration(
            hintText: tr.email,
            prefixIcon: Icon(AppIcons.email, color: AppColors.whiteColor),
          ),
        ),
        SizedBox(height: responsiveHeight(16)),
        TextFormField(
          key: const Key('passwordField'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: !isPasswordVisible,
          obscuringCharacter: '*',
          enableSuggestions: false,
          autocorrect: false,
          validator: (value) => AppValidate.validatePassword(value, context),
          focusNode: passwordFocusNode,
          controller: passwordController,
          style: AppTextStyles.BalooThambi2_500_16.copyWith(
            color: AppColors.whiteColor,
          ),
          decoration: InputDecoration(
            hintText: tr.password,
            prefixIcon: Icon(AppIcons.password, color: AppColors.whiteColor),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible
                    ? AppIcons.passwordVisibility
                    : AppIcons.passwordVisibilityOff,
                color: AppColors.whiteColor,
              ),
              onPressed: onPasswordVisibilityToggle,
            ),
          ),
        ),
        SizedBox(height: responsiveHeight(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, PagesRoutes.forgetPasswordView);
              },
              child: Text(
                tr.forgetPassword,
                style: AppTextStyles.BalooThambi2_400_12.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveHeight(8)),
        Center(
          child: ElevatedButton(
            key: const Key('signInButton'),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(responsiveWidth(283), responsiveHeight(50)),
              backgroundColor: isFormValid
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
            ),
            // onPressed: onSubmit,
            // onPressed: isFormValid ? onSubmit : null,
            onPressed: () {
              if (isFormValid) {
                onSubmit();
              }
            },

            child: Text(
              tr.login,
              style: AppTextStyles.BalooThambi2_600_14.copyWith(
                color: isFormValid
                    ? AppColors.whiteColor
                    : AppColors.greyDarkColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SizedBox(height: responsiveHeight(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tr.DoNotHaveAccountYet,
              style: AppTextStyles.BalooThambi2_400_14.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, PagesRoutes.signUpFlowView);
              },
              child: Text(
                tr.register,
                style: AppTextStyles.BalooThambi2_400_14.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
