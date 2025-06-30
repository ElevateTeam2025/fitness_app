import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/router/pages_routes.dart';
import '../../../../../core/services/shared_preference_services.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/constant_manager.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_container_widget.dart';
import '../../../../../core/widgets/custom_validate.dart';
import '../../../../meals_categories/presentation/views/widgets/meals_categories_back_ground_image.dart';
import '../cubit/change_password_cubit/change_password_state.dart';
import '../cubit/change_password_cubit/change_password_view-model.dart';
import 'app_bar.dart';
import 'back_ground.dart';


class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<ChangePasswordViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: Stack(

        children: [
          ChangePasswordBackGroundImage(),


          SingleChildScrollView(
            child: Column(
              children: [
                ChangePasswordCustomAppBar(),
                SizedBox(height :16.HeightResponsive),
                Column(
                  children: [
                    CustomContainerWidget(body: [

                      BlocConsumer<ChangePasswordViewModel, ChangePasswordState>(
                        listener: (context, state) {
                          if (state is ChangePasswordErrorState) {
                            EasyLoading.dismiss();
                            EasyLoading.showError(state.errorMessage);
                          }
                          if (state is ChangePasswordSuccessState) {
                            EasyLoading.dismiss();
                            EasyLoading.showSuccess("Password changed successfully");
                            SharedPreferenceServices.deleteData(AppConstants.token);
                            Navigator.pushNamedAndRemoveUntil(context, PagesRoutes.signIn,(route) => false,);
                          }
                          if (state is ChangePasswordLoadingState) {
                            EasyLoading.show();
                          }
                        },
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
                            child: Form(
                              key: viewModel.formKey,
                              child: Column(
                                children: [
                                  SizedBox(height:30.HeightResponsive),
                                  TextFormField(
                                    key: const Key('passwordField'),
                                    validator: AppValidate.validatePassword,
                                    obscuringCharacter: '*',
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    controller: viewModel.currentPasswordController,
                                    style: AppTextStyles.BalooThambi2_500_16.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                    decoration:   InputDecoration(
                                      hintText: "Current password",

                                      prefixIcon: Icon(AppIcons.password, color: AppColors.whiteColor),

                                    ),


                                  ),
                                  SizedBox(height: 24.HeightResponsive),
                                  TextFormField(
                                    obscuringCharacter: "*",
                                    obscureText: true,
                                    controller: viewModel.newPasswordController,
                                    validator: AppValidate.validatePassword,
                                    decoration: InputDecoration(
                                      hintText: "New password",
                                    ),
                                    style: AppTextStyles.BalooThambi2_500_16.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  SizedBox(height:24.HeightResponsive),
                                  TextFormField(
                                    obscuringCharacter: "*",
                                    obscureText: true,
                                    style: AppTextStyles.BalooThambi2_500_16.copyWith(
                                      color: AppColors.whiteColor,
                                    ),
                                    validator: viewModel.confirmPasswordValidator,
                                    controller: viewModel.confirmPasswordController,
                                    decoration: InputDecoration(
                                      hintText: "Confirm password",

                                    ),
                                  ),
                                  SizedBox(height: 24.HeightResponsive),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      if (BlocProvider.of<ChangePasswordViewModel>(
                                        context,
                                      ).formKey.currentState!.validate()) {
                                        viewModel.doIntent(ClickedChangePasswordIntent());
                                      }
                                    },
                                    child: Text(
                                      "update",
                                      style: AppTextStyles.BalooThambi2_600_16.copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ) ;
  }
}
