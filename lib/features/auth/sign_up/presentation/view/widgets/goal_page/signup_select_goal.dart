import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../core/widgets/custom_container_widget.dart';
import '../../../../../../../generated/l10n.dart';
import '../build_page_title.dart';

class SignupSelectGoal extends StatelessWidget {
  SignupSelectGoal({super.key});

  final List<String> goals = [
    "Gain weight",
    "lose weight",
    "Get fitter",
    "Gain more flexible",
    "Learn the basic",
  ];

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    final viewModel = context.read<SignupCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildPageTitle(title: tr.whatYourGoal,
            subTitle: tr.helpsCreatePersonalizedPlan,),

          CustomContainerWidget(
            body: [


              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  bool hasSelect = state.selectedGoal != null &&
                      state.selectedGoal.isNotEmpty;

                  return Column(
                    children: [

                      ...goals.map((goal) {
                        return CustomListTile(title: goal,
                            isSelected: state.selectedGoal == goal,
                            onPress: () {
                              viewModel.selectGoal(goal);
                            },);
                      },),
                      ElevatedButton(
                        onPressed: hasSelect ? () => viewModel.nextStep() : null,
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
                    ],
                  );
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
}
