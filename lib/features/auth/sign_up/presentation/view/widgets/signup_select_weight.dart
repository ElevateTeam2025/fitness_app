import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/weel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widgets/custom_container_widget.dart';
import '../../cubit/signup_view_model_cubit.dart';
import '../../cubit/signup_view_model_state.dart';
import 'build_page_title.dart';

class SignupSelectWeight extends StatelessWidget {
  const SignupSelectWeight({super.key});

  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();
    return Column(
      children: [
        BuildPageTitle(title: "WHAT IS YOU WEIGHT ?",
          subTitle: "This Helps Us Create Your Personalized plan",),

        CustomContainerWidget(

            body: [
              // add wheel here
              BlocBuilder<SignupCubit,SignupState>(
                builder: (context, state) {
                  return WheelWidget(minVal: 55, maxVal: 250, initVal: 75, onValueChange: (value) {
                    print(value);
                    viewModel.state.weight=value;
                  }, label: "Kg");
                },

              ),
              ElevatedButton(
                onPressed:()=>viewModel.nextStep(),

                child: Text(
                  'Next',
                  style: AppTextStyles.BalooThambi2_800_14.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: AppColors.greyColor,
                ),
              ),
            ]

        ),
      ],
    );

  }
}
