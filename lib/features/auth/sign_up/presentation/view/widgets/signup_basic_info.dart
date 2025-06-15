import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/text_styles.dart';
import '../../cubit/signup_view_model_cubit.dart';

class SignupBasicInfo extends StatelessWidget {
  const SignupBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey There',
              style: AppTextStyles.BalooThambi2_400_18.copyWith(
                color: Colors.white,
              ),
            ),

            Text(
              'CREATE AN ACCOUNT',
              style: AppTextStyles.BalooThambi2_800_20.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        CustomContainerWidget(
          body: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) => cubit.updateName(value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_sharp,color: AppColors.whiteColor,),
                      hintText: "First Name"
                    ),
                  ),
                  SizedBox(height: 16.HeightResponsive),
                  TextField(
                    onChanged: (value) => cubit.updateEmail(value),
                    decoration: InputDecoration(
                      hintText: "last Name ",
                      prefixIcon: Icon(Icons.person_outline_sharp,color: AppColors.whiteColor,),
                    ),
                  ),
                  SizedBox(height: 32.HeightResponsive),
                  ElevatedButton(

                    onPressed: () => cubit.nextStep(),
                    child: Text('Register',style: AppTextStyles.BalooThambi2_800_14.copyWith(color: AppColors.whiteColor),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
