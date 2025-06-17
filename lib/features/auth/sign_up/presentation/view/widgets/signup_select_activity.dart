import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widgets/custom_container_widget.dart';
import '../../cubit/signup_view_model_cubit.dart';
import '../../cubit/signup_view_model_state.dart';
import 'build_page_title.dart';
import 'custom_list_tile.dart';

class SignupSelectActivity extends StatelessWidget {
   SignupSelectActivity({super.key});

  final List<String> activities = [
    "Rookie",
    "Beginner",
    "Intermediate",
    "Advance",
    "True Beast",
  ];
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildPageTitle(title: "YOUR REGULAR PHYSICAL ACTIVITY LEVEL",
            subTitle: "",),

          CustomContainerWidget(
            body: [


              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  bool hasSelect = state.selectedActivity != null &&
                      state.selectedActivity.isNotEmpty;

                  return Column(
                    children: [

                      ...activities.map((activity) {
                        return CustomListTile(title: activity,
                          isSelected: state.selectedActivity == activity,
                          onPress: () {
                            viewModel.selectActivity(activity);
                          },);
                      },),

                      // here call function that call the api to submit the user data to register
                      ElevatedButton(
                        onPressed: hasSelect ? () => viewModel.nextStep() : null,

                        child: Text(
                          'Submit',
                          style: AppTextStyles.BalooThambi2_800_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: AppColors.greyColor,
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
