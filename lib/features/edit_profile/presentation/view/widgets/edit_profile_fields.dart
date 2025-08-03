import 'dart:developer';

import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/build_page_title.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/custom_list_tile.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/weel_widget.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_states.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileFields extends StatefulWidget {
  const EditProfileFields({
    super.key,
    required this.viewModel,
    required this.initialPage,
  });
  final EditProfileViewModel viewModel;
  final int initialPage;
  @override
  State<EditProfileFields> createState() => _EditProfileFieldsState();
}

class _EditProfileFieldsState extends State<EditProfileFields> {
  final List<String> goals = [
    "Gain weight",
    "lose weight",
    "Get fitter",
    "Gain more flexible",
    "Learn the basic",
  ];
  final Map<String, String> activities = {
    "Rookie": "level1",
    "Beginner": "level2",
    "Intermediate": "level3",
    "Advance": "level4",
    "True Beast": "level5",
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileViewModel, EditProfileStates>(
      bloc: widget.viewModel,
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Container(),
            elevation: 0,
            title: Image.asset(
              ImageAssets.bgImage,
              height: 48.heightResponsive,
              width: 70.widthResponsive,
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  ImageAssets.mealDetailsBg,
                  fit: BoxFit.cover,
                ),
              ),
              PageView(
                controller: PageController(
                  initialPage: widget.initialPage,
                  viewportFraction: 1,
                  keepPage: true,
                ),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  EditWeightWidget(viewmodel: widget.viewModel),
                  EditGoalWidget(goals: goals, viewmodel: widget.viewModel),
                  EditActivityWidget(
                    activities: activities,
                    viewmodel: widget.viewModel,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class EditGoalWidget extends StatelessWidget {
  EditGoalWidget({super.key, required this.goals, required this.viewmodel});
  final EditProfileViewModel viewmodel;

  final List<String> goals;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildPageTitle(
          title: "WHAT IS YOUR GOAL?",
          subTitle: "This Helps Us Create Your Personalized plan",
        ),
        CustomContainerWidget(
          body: [
            Column(
              children: [
                ...goals.map((goal) {
                  return Column(
                    children: [
                      SizedBox(height: 10.heightResponsive),
                      CustomListTile(
                        title: goal,
                        isSelected: viewmodel.selectedGoal == goal,
                        onPress: () {
                          log('Selected goal: $goal');
                          // viewmodel.changeGoal(goal);
                          viewmodel.doIntents(OnChangeGoalIntent(goal));

                          log(viewmodel.selectedGoal.toString());
                        },
                      ),
                    ],
                  );
                }),
                SizedBox(height: 10.heightResponsive),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: AppColors.greyColor,
                  ),
                  child: Text(
                    'Done',
                    style: AppTextStyles.BalooThambi2_800_14.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class EditActivityWidget extends StatelessWidget {
  const EditActivityWidget({
    super.key,
    required this.activities,
    required this.viewmodel,
  });

  final Map<String, String> activities;
  final EditProfileViewModel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildPageTitle(
          title: "YOUR REGULAR PHYSICAL ACTIVITY LEVEL",
          subTitle: "",
        ),

        CustomContainerWidget(
          body: [
            Column(
              children: [
                ...activities.entries.map((activity) {
                  final name = activity.key;
                  final level = activity.value;
                  return Column(
                    children: [
                      SizedBox(height: 10.heightResponsive),
                      CustomListTile(
                        title: name,
                        isSelected: viewmodel.selectedActivity == level,
                        onPress: () {
                          log('Selected activity: $level');
                          // viewmodel.changeGoal(goal);
                          viewmodel.doIntents(OnChangeActivityIntent(level));

                          log(viewmodel.selectedGoal.toString());
                        },
                      ),
                    ],
                  );
                }),
                SizedBox(height: 10.heightResponsive),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: AppColors.greyColor,
                  ),
                  child: Text(
                    'Done',
                    style: AppTextStyles.BalooThambi2_800_14.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class EditWeightWidget extends StatelessWidget {
  EditWeightWidget({super.key, required this.viewmodel});
  final EditProfileViewModel viewmodel;
  late int newWeight;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildPageTitle(
            title: "WHAT IS YOU WEIGHT ?",
            subTitle: "This Helps Us Create Your Personalized plan",
          ),
          SizedBox(height: 20.heightResponsive),
          CustomContainerWidget(
            body: [
              WheelWidget(
                minVal: 55,
                maxVal: 250,
                initVal: 75,
                onValueChange: (value) {
                  log('changed value: $value');
                  newWeight = value;
                  log(viewmodel.weight.toString());

                },
                label: "Kg",
              ),
              ElevatedButton(
                onPressed: () {
                  log(viewmodel.weight.toString());
                  // viewmodel.changeWeight(newWeight);
                  viewmodel.doIntents(OnChangeWeightIntent(newWeight));

                  log(viewmodel.weight.toString());
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: AppColors.greyColor,
                ),

                child: Text(
                  'Done',
                  style: AppTextStyles.BalooThambi2_800_14.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
