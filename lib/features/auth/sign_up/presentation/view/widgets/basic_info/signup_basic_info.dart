import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/text_styles.dart';
import '../../../cubit/signup_view_model_cubit.dart';
import '../build_page_title.dart';

class SignupBasicInfo extends StatelessWidget {
  const SignupBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: BlocBuilder<SignupCubit, SignupState>(
  builder: (context, state) {
    final cubit = context.read<SignupCubit>();
    return Column(
        children: [
          BuildPageTitle(title: "Hey There",subTitle: "CREATE AN ACCOUNT",),
          CustomContainerWidget(
            body: [
              Padding(
                padding: EdgeInsets.all(16.HeightResponsive),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      key: const Key('firstNameField'),
                      onChanged: (value) => cubit.updateFirstName(value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline_sharp,
                          color: AppColors.whiteColor,
                        ),
                        hintText: "First Name",
                      ),
                      style: AppTextStyles.BalooThambi2_400_14.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 16.HeightResponsive),
                    TextField(
                      key: const Key('lastNameField'),
                      onChanged: (value) => cubit.updateLastName(value),
                      decoration: InputDecoration(
                        hintText: "last Name ",
                        prefixIcon: Icon(
                          Icons.person_outline_sharp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      style: AppTextStyles.BalooThambi2_400_14.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 16.HeightResponsive),

                    TextField(
                      key: const Key('emailField'),
                      onChanged: (value) => cubit.updateEmail(value),

                      decoration: InputDecoration(
                        hintText: "Email ",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      style: AppTextStyles.BalooThambi2_400_14.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 16.HeightResponsive),

                    TextField(
                      key: const Key('passwordField'),
                      obscureText:true ,
                      onChanged: (value) => cubit.updatePassword(value),
                      decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      style: AppTextStyles.BalooThambi2_400_14.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 32.HeightResponsive),
                    ElevatedButton(
                      key: const Key('registerButton'),
                      onPressed: state.isBasicInfoValid ? () => cubit.nextStep() : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        disabledBackgroundColor: Colors.grey,
                      ),
                      child: Text(
                        'Register',
                        style: AppTextStyles.BalooThambi2_800_14.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    _aleadyHaveAccount()
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



  Widget _aleadyHaveAccount(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already Have an account ?", style: AppTextStyles.BalooThambi2_400_14.copyWith(color: AppColors.whiteColor)),
        TextButton(
          onPressed: () {
          },
          child: Text(
            "Login",
            style: AppTextStyles.BalooThambi2_400_14.copyWith(
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
