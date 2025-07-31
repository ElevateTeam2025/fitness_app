import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_cubit.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments as UserData;
    return BlocProvider(
      create: (context) => getIt.get<UploadPhotoCubit>(),
      child: Scaffold(
        body: EditProfileViewBody(userData: argument,),
      ),
    );
  }
}
