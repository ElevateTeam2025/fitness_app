import 'dart:io';
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_states.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_view_model.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_cubit.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_states.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/edit_label_text_widget.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/edit_profile_back_ground_image.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/edit_profile_custom_app_bar.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/edit_profile_fields.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/profile_photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  File? _image;
  File? imageFile;
  late final TextEditingController _firstNameController = TextEditingController(
    text: 'ahemed',
  );
  late final TextEditingController _lastNameController = TextEditingController(
    text: 'moahmed',
  );
  late final TextEditingController _emailController = TextEditingController(
    text: 'hassan@gmail.com',
  );

  @override
  void initState() {
    context.read<EditProfileViewModel>().weight = 80;
    context.read<EditProfileViewModel>().selectedActivity = 'level1';
    context.read<EditProfileViewModel>().selectedGoal = 'Gain weight';
    // // context.read<EditProfileViewModel>().selectedGoal =
    // final viewModel = context.read<EditProfileViewModel>();
    // viewModel.weight ??= 75; // Only sets if null
    super.initState();
  }

  final EditProfileViewModel viewModel = getIt.get<EditProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EditProfileViewModel>();
    return BlocConsumer<EditProfileViewModel, EditProfileStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Profile updated successfully');
        } else if (state is EditProfileLoading) {
          EasyLoading.show();
        } else if (state is EditProfileError) {
          EasyLoading.showError(state.message);
        }
      },
      builder: (context, state) {
        print(viewModel.weight);
        print('////////////////////////////////////////');
        return Stack(
          children: [
            EditProfileBackGroundImage(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.HeightResponsive),
                    EditProfileCustomAppBar(),
                    SizedBox(height: 30.HeightResponsive),
                    Center(
                      child: SizedBox(
                        height: 102.HeightResponsive,
                        width: 102.WidthResponsive,
                        child: Stack(
                          children: [
                            ProfilePhotoWidget(image: _image),
                            BlocListener<UploadPhotoCubit, UploadPhotoStates>(
                              listener: (context, state) {
                                if (state is UploadPhotoSuccess) {
                                  EasyLoading.dismiss();
                                  setState(() {
                                    _image = imageFile;
                                  });
                                } else if (state is UploadPhotoLoading) {
                                  EasyLoading.show();
                                } else if (state is UploadPhotoError) {
                                  EasyLoading.showError(state.message);
                                }
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () async {
                                    ImagePicker picker = ImagePicker();
                                    XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );

                                    if (image != null) {
                                      imageFile = File(image.path);

                                      await context
                                          .read<UploadPhotoCubit>()
                                          .uploadPhoto(imageFile!);
                                    }
                                  },
                                  icon: Image.asset(IconAssets.editIcon),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.HeightResponsive),
                    Center(
                      child: Text(
                        'Ahmed Moahmed',
                        style: AppTextStyles.BalooThambi2_600_20.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.HeightResponsive),
                    TextFormField(
                      controller: _firstNameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_4_outlined,
                          color: Color(0xffD3D3D3),
                        ),
                        labelText: 'first name',
                      ),
                    ),
                    SizedBox(height: 16.HeightResponsive),
                    TextFormField(
                      controller: _lastNameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_4_outlined,
                          color: Color(0xffD3D3D3),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.HeightResponsive),
                    TextFormField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.mail_outlined,
                          color: Color(0xffD3D3D3),
                        ),
                        hintText: 'Mail',
                      ),
                    ),
                    SizedBox(height: 30.HeightResponsive),
                    EditLabelTextWidget(
                      label: 'Your Weight',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileFields(
                              viewModel: viewModel,
                              initialPage: 0,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8.HeightResponsive),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText:
                            '${context.watch<EditProfileViewModel>().weight} kg',
                      ),
                    ),
                    SizedBox(height: 16.HeightResponsive),
                    EditLabelTextWidget(
                      label: 'Your Goal',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileFields(
                              viewModel: viewModel,
                              initialPage: 1,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8.HeightResponsive),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: viewModel.selectedGoal ?? 'goal',
                      ),
                    ),
                    SizedBox(height: 16.HeightResponsive),
                    EditLabelTextWidget(
                      label: 'Your activity level',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileFields(
                              viewModel: viewModel,
                              initialPage: 2,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8.HeightResponsive),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: viewModel.selectedActivity ?? 'activity',
                      ),
                    ),
                    SizedBox(height: 5.HeightResponsive),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.doIntents(
                            OnClickEditProfileIntent({
                              'firstName': _firstNameController.text,
                              'lastName': _lastNameController.text,
                              'email': _emailController.text,
                              'weight': viewModel.weight.toString(),
                              'goal': viewModel.selectedGoal ?? '',
                              'activityLevel': viewModel.selectedActivity ?? '',
                            }),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: AppColors.greyColor,
                        ),
                        child: Text(
                          'Edit Profile',
                          style: AppTextStyles.BalooThambi2_800_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
