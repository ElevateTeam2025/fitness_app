import 'dart:io';
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_cubit.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_states.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/edit_label_text_widget.dart';
import 'package:fitness_app/features/edit_profile/presentation/view/widgets/edit_profile_back_ground_image.dart';
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

  @override
  Widget build(BuildContext context) {
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
                Center(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 25.HeightResponsive,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(
                              50.RadiusResponsive,
                            ),
                          ),
                          child: Image(image: AssetImage(IconAssets.backIcon)),
                        ),
                      ),
                      SizedBox(width: 88.WidthResponsive),
                      Text(
                        'Edit Profile',
                        style: AppTextStyles.BalooThambi2_600_20.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.HeightResponsive),
                Center(
                  child: SizedBox(
                    height: 102.HeightResponsive,
                    width: 102.WidthResponsive,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60.RadiusResponsive,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : NetworkImage(
                                  'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=',
                                ),
                        ),
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

                              await    context.read<UploadPhotoCubit>().uploadPhoto(
                                    imageFile!,
                                  );
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
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_4_outlined,
                      color: Color(0xffD3D3D3),
                    ),
                    hintText: 'Ahmed',
                  ),
                ),

                SizedBox(height: 16.HeightResponsive),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_4_outlined,
                      color: Color(0xffD3D3D3),
                    ),
                    hintText: 'Moahmed',
                  ),
                ),
                SizedBox(height: 16.HeightResponsive),

                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.mail_outlined,
                      color: Color(0xffD3D3D3),
                    ),
                    hintText: 'Mail',
                  ),
                ),
                SizedBox(height: 30.HeightResponsive),
                EditLabelTextWidget(label: 'Your Weight', onTap: () {}),
                SizedBox(height: 8.HeightResponsive),
                TextFormField(decoration: InputDecoration(hintText: '90 kg')),
                SizedBox(height: 16.HeightResponsive),
                EditLabelTextWidget(label: 'Your Goal', onTap: () {}),
                SizedBox(height: 8.HeightResponsive),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Gain Weight'),
                ),
                SizedBox(height: 16.HeightResponsive),
                EditLabelTextWidget(label: 'Your activity level', onTap: () {}),
                SizedBox(height: 8.HeightResponsive),
                TextFormField(decoration: InputDecoration(hintText: 'Rookie')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
