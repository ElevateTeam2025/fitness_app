import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/weel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widgets/custom_container_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/signup_view_model_state.dart';
import 'build_page_title.dart';

class SignupSelectHeight extends StatelessWidget {
  const SignupSelectHeight({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();
    var tr = S.of(context);
    return Column(
      children: [
        BuildPageTitle(title: tr.whatYourHeight,
          subTitle: tr.helpsCreatePersonalizedPlan,),

        CustomContainerWidget(

            body: [
              // add wheel here
              BlocBuilder<SignupCubit,SignupState>(
                builder: (context, state) {
                  return WheelWidget(minVal: 100, maxVal: 250, initVal: 151, onValueChange: (value) {
                    print(value);
                    viewModel.state.height=value;
                  }, label: tr.cm);
                },

              ),
              ElevatedButton(
                onPressed:()=>viewModel.nextStep(),
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: AppColors.greyColor,
                ),

                child: Text(
                  tr.next,
                  style: AppTextStyles.BalooThambi2_800_14.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ]

        ),
      ],
    );

  }
}
