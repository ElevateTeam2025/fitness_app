import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_dialog.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_data_response_entity.dart';
import 'package:fitness_app/features/worksout/presentation/manager/workout_state.dart';
import 'package:fitness_app/features/worksout/presentation/view/widget/custom_muscles_card.dart';
import 'package:fitness_app/features/worksout/presentation/view/widget/custom_muscles_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../manager/workout_view_model.dart';

class WorkoutTab extends StatelessWidget {
  const WorkoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<WorkoutViewModel>();
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<WorkoutViewModel, WorkoutState>(
        bloc: viewModel..doIntent(GetMusclesTabIntent()),
        listener: (context, state) {
          if (state is GetMusclesTabErrorState) {
            DialogUtils.showMessage(
              context: context,
              message: state.message,
              title: "Error",
              postActionName: "Ok",
            );
          }
          if (state is GetAllMusclesDataErrorState) {
            DialogUtils.showMessage(
              context: context,
              message: state.message,
              title: "Error",
              postActionName: "Ok",
            );
          }
          if (state is GetMusclesTabSuccessState &&
              viewModel.musclesTab.isNotEmpty) {
            viewModel.doIntent(
              GetAllMusclesDataIntent(viewModel.musclesTab[0].id.toString()),
            );
          }
        },
        builder: (context, state) {
          return Container(
            color: AppColors.greyDark2,
            padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.HeightResponsive),
                Text(
                  "Workouts",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.BalooThambi2_800_24.copyWith(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 24.HeightResponsive),
                state is GetMusclesTabLoadingState
                    ? Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 10.WidthResponsive);
                          },
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Skeletonizer(
                              enabled: true,
                              child: Text("ewfw"),
                            );
                          },
                        ),
                      )
                    : viewModel.musclesTab.isNotEmpty
                    ? CustomMusclesTab(musclesTab: viewModel.musclesTab)
                    : Text(
                        "Muscle not found",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.BalooThambi2_600_12.copyWith(
                          decoration: TextDecoration.none,
                        ),

                      ),
                state is GetAllMusclesDataLoadingState
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 18.WidthResponsive,
                                childAspectRatio: 1.018,
                                mainAxisSpacing: 17.HeightResponsive,
                              ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Skeletonizer(
                              enabled: true,
                              child: CustomMusclesCard(
                                muscle: MusclesDataListEntity(
                                  image: "https://iili.io/33pYHNI.png",
                                  name: "",
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : state is GetAllMusclesDataSuccessState &&
                          viewModel.musclesData.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 18.WidthResponsive,
                                childAspectRatio: 1.018,
                                mainAxisSpacing: 17.HeightResponsive,
                              ),
                          itemCount: viewModel.musclesData.length,
                          itemBuilder: (context, index) {
                            return CustomMusclesCard(
                              muscle: viewModel.musclesData[index],
                            );
                          },
                        ),
                      )
                    : state is! GetMusclesTabLoadingState &&
                          viewModel.musclesData.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            "Muscle not found",
                            style: AppTextStyles.BalooThambi2_600_18.copyWith(
                              color: AppColors.whiteColor,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
