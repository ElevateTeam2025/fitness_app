import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/signup_view_model_cubit.dart';
import '../build_page_title.dart';
import 'gender_widget.dart';

class SignupSelectGender extends StatelessWidget {
  const SignupSelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();

    return Column(

      children: [
        BuildPageTitle(title: "TELL US ABOUT YOURSELF",
          subTitle: "We need to know your gender",),

        CustomContainerWidget(
            body: [

              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  return Column(

                    children: [
                      GenderWidget(onPress: () {
                        viewModel.selectGender("male");

                        },
                        icon: IconAssets.maleIcon,
                        isSelected: viewModel.state.gender == "male",name: "male",)
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
