import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';
import 'package:fitness_app/features/worksout/presentation/manager/workout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMusclesTab extends StatelessWidget {
  const CustomMusclesTab({super.key, required this.musclesTab});

  final List<MusclesComponentEntity> musclesTab;

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<WorkoutViewModel>(context);
    return SizedBox(
      height: 30.heightResponsive,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 10.widthResponsive);
        },
        itemCount: musclesTab.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              viewModel.doIntent(ChangeTabIntent(index));
              viewModel.doIntent(GetAllMusclesDataIntent(musclesTab[index].id.toString()));
            },
            child: Container(
              width: 68.widthResponsive,
              height: 30.heightResponsive,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: viewModel.selectedTab == index
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20.borderResponsive),
              ),
              child: Text(
                musclesTab[index].name ?? "",
                style: AppTextStyles.balooThambi2_600_12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
