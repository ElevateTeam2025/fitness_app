import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../cubit/signup_view_model_cubit.dart';
import '../build_page_title.dart';
import 'gender_widget.dart';

class SignupSelectGender extends StatelessWidget {
  const SignupSelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();
    var tr = S.of(context);
    return Column(

      children: [
        BuildPageTitle(title: tr.tellAboutYourself,
          subTitle: tr.needKnowYourGender,),

        CustomContainerWidget(
            body: [

              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  final hasSelected = state.gender != false && state.gender.isNotEmpty;

                  return Column(

                    children: [
                      GenderWidget(onPress: () {
                        viewModel.selectGender("male");
                        },
                        icon: IconAssets.maleIcon,
                        isSelected: viewModel.state.gender == "male",name: tr.male,),

                      SizedBox(height: 24.heightResponsive,),
                      GenderWidget(onPress: () {
                        viewModel.selectGender("female");

                      },
                        icon: IconAssets.femaleIcon,
                        isSelected: viewModel.state.gender == "female",name: tr.female,),
                      SizedBox(height:32.heightResponsive),
                      ElevatedButton(
                        onPressed:hasSelected? () => viewModel.nextStep():null,
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
              )


            ]

        ),

      ],
    );
  }
}
