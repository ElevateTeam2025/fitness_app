import 'package:flutter/material.dart';

import '../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../core/router/pages_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_validate.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AutovalidateMode validateMode;
  final bool isPasswordVisible;
  final VoidCallback onPasswordVisibilityToggle;
  final Function(String) onChange;
  final VoidCallback onSubmit;

  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.validateMode,
    required this.isPasswordVisible,
    required this.onPasswordVisibilityToggle,
    required this.onChange,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Login',
          style: AppTextStyles.BalooThambi2_700_20.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(height: responsiveHeight(8)),
        TextFormField(
          key: const Key('emailField'),
          autovalidateMode: validateMode,
          validator: AppValidate.validateEmail,
          onChanged: onChange,
          controller: emailController,
          style: AppTextStyles.BalooThambi2_500_16.copyWith(color: AppColors.whiteColor),
          decoration: InputDecoration(
            hintText: 'email',
            prefixIcon: Icon(
              AppIcons.email,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        SizedBox(height: responsiveHeight(16)),
        TextFormField(
          key: const Key('passwordField'),
          autovalidateMode: validateMode,
          obscureText: !isPasswordVisible,
          obscuringCharacter: '*',
          enableSuggestions: false,
          autocorrect: false,
          validator: AppValidate.validatePassword,
          onChanged: onChange,
          controller: passwordController,
          style: AppTextStyles.BalooThambi2_500_16.copyWith(color: AppColors.whiteColor),
          decoration: InputDecoration(
            hintText: 'password',
            prefixIcon: Icon(
              AppIcons.password,
              color: AppColors.whiteColor,
            ),
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
                Navigator.pushNamed(context, PagesRoutes.forgetPassword);
              },
              child: Text(
                'forgetPassword',
                style: AppTextStyles.BalooThambi2_400_12.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveHeight(8)),
        Center(
          child: ElevatedButton(
            key: Key('signInButton'),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(responsiveWidth(283),responsiveHeight(50)),
              backgroundColor: validateMode == AutovalidateMode.disabled
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
            ),
            onPressed: onSubmit,
            child: Text(
              'Login',
              style: AppTextStyles.BalooThambi2_600_14.copyWith(
                color: validateMode == AutovalidateMode.disabled
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
              "Don't have an account yet ? ",
              style: AppTextStyles.BalooThambi2_400_14.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                " Register",
                style: AppTextStyles.BalooThambi2_400_14.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
