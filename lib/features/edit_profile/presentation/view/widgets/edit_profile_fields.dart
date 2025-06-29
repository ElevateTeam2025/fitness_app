import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/build_page_title.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/custom_list_tile.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/weel_widget.dart';
import 'package:flutter/material.dart';

class EditProfileFields extends StatefulWidget {
  const EditProfileFields({super.key});

  @override
  State<EditProfileFields> createState() => _EditProfileFieldsState();
}

class _EditProfileFieldsState extends State<EditProfileFields> {
  late int initialPage;

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
    initialPage = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(),
        elevation: 0,
        title: Image.asset(
          ImageAssets.bgImage,
          height: 48.HeightResponsive,
          width: 70.WidthResponsive,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(ImageAssets.mealDetailsBg, fit: BoxFit.cover),
          ),
          PageView(
            controller: PageController(
              initialPage: initialPage,
              viewportFraction: 1,
              keepPage: true,
            ),
            physics: NeverScrollableScrollPhysics(),
            children: [
              EditWeightWidget(),
              EditGoalWidget(goals: goals),
              EditActivityWidget(activities: activities),
            ],
          ),
        ],
      ),
    );
  }
}

class EditGoalWidget extends StatelessWidget {
  const EditGoalWidget({
    super.key,
    required this.goals,
  });

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
                      SizedBox(height: 10.HeightResponsive),
                      CustomListTile(
                        title: goal,
                        isSelected: false,
                        onPress: () {},
                      ),
                    ],
                  );
                }),
                SizedBox(height: 10.HeightResponsive),

                ElevatedButton(
                  onPressed: () {},
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
  });

  final Map<String, String> activities;

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
                      SizedBox(height: 10.HeightResponsive),
                      CustomListTile(
                        title: name,
                        isSelected: false,
                        onPress: () {},
                      ),
                    ],
                  );
                }),
                SizedBox(height: 10.HeightResponsive),

                ElevatedButton(
                  onPressed: () {},
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
  const EditWeightWidget({super.key});

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
          SizedBox(height: 20.HeightResponsive),
          CustomContainerWidget(
            body: [
              WheelWidget(
                minVal: 55,
                maxVal: 250,
                initVal: 75,
                onValueChange: (value) {
                  print(value);
                },
                label: "Kg",
              ),
              ElevatedButton(
                onPressed: () {},
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
