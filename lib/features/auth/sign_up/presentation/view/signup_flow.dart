import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_basic_info.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_age.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_gender.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_goal.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_height.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_assets.dart';

class SignupFlow extends StatefulWidget {
  const SignupFlow({super.key});

  @override
  State<SignupFlow> createState() => _SignupFlowState();
}

class _SignupFlowState extends State<SignupFlow> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Builder(
          builder: (context) {
            final viewModel = context.read<SignupCubit>();

            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: BlocListener<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (_pageController.page?.round() != state.currentStep) {
                    _pageController.animateToPage(
                      state.currentStep,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        ImageAssets.mainBackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 46.HeightResponsive),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<SignupCubit, SignupState>(
                            builder: (context, state) {
                              return Stack(
                                children: [
                                  if (viewModel.state.currentStep >= 1)
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: () {
                                          viewModel.previousStep();
                                        },
                                        child: Container(
                                          width: 30.WidthResponsive,
                                          height: 30.WidthResponsive,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,

                                            borderRadius: BorderRadius.circular(
                                                100),
                                          ),
                                          child: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Image.asset(ImageAssets.appIcon),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

                          // build here progress indecator
                          SizedBox(height: 96.HeightResponsive),

                          Expanded(
                            child: PageView(
                              controller: _pageController,

                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                SignupBasicInfo(),
                                SignupSelectGender(),
                                SignupSelectAge(),
                                SignupSelectHeight(),
                                SignupSelectWeight(),
                                SignupSelectGoal(),
                                SignupSelectGoal(),
                              ],
                            ),
                          ),

                          //
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
