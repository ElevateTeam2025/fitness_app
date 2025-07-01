import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widgets/custom_container_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../cubit/signup_view_model_cubit.dart';
import '../../cubit/signup_view_model_state.dart';
import 'build_page_title.dart';
import 'custom_list_tile.dart';

class SignupSelectActivity extends StatelessWidget {
  SignupSelectActivity({super.key});

  final Map<String,String> activities = {
    "Rookie": "level1",
    "Beginner": "level2",
    "Intermediate": "level3",
    "Advance": "level4",
    "True Beast": "level5",
  };

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildPageTitle(title: S.of(context).yourRegularPhysicalActivityLevel,
            subTitle: "",),

          CustomContainerWidget(
            body: [


              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  bool hasSelect = state.selectedActivity != null &&
                      state.selectedActivity.isNotEmpty;

                  return Column(
                    children: [

                      // ...activities.map((activity) {
                      //   return CustomListTile(title: activity,
                      //     isSelected: state.selectedActivity == activity,
                      //     onPress: () {
                      //       viewModel.selectActivity(activity);
                      //     },);
                      // },),
                      ...activities.entries.map((activity) {
                        final name = activity.key;
                        final level = activity.value;
                        return CustomListTile(
                          title: name,
                          isSelected: state.selectedActivity == level,
                          onPress: () {
                            viewModel.selectActivity(level);
                          },
                        );
                      },),
                      BlocListener<SignupCubit ,SignupState>(
                        listener: (context, state) {
                          if(state.isSuccess){
                            EasyLoading.showSuccess(state.success.toString());
                            Navigator.pushNamed(context, PagesRoutes.signIn);
                          }
                          else if(state.isLoading)
                            {
                              EasyLoading.show();
                            }
                          else if (state.error != null){
                            EasyLoading.showError(state.error.toString());
                          }

                        },
                        child: ElevatedButton(
                          onPressed: hasSelect
                              ? () => viewModel.subimt()
                              : null,
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: AppColors.greyColor,
                          ),

                          child: Text(
                            S.of(context).submit,
                            style: AppTextStyles.BalooThambi2_800_14.copyWith(
                              color: AppColors.whiteColor,
                            ),
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
