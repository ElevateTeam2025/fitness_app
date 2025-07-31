import 'dart:io';

import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key, required File? image, required this.userData}) : _image = image;
final UserData userData;
  final File? _image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60.RadiusResponsive,
      backgroundImage: _image != null
          ? FileImage(_image!)
          : NetworkImage(
        userData.photo.toString(),
              // 'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=',
            ),
    );
  }
}
