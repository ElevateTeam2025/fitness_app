import 'dart:io';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/domain/repo/upload_photo_repo.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoCubit extends Cubit<UploadPhotoStates> {
  final UploadPhotoRepo _uploadPhotoRepo;
  UploadPhotoCubit(UploadPhotoRepo uploadPhotoRepo)
    : _uploadPhotoRepo = uploadPhotoRepo,
      super(UploadPhotoInitial());
  Future<void> uploadPhoto(File photo) async {
    emit(UploadPhotoLoading());
    final result = await _uploadPhotoRepo.uploadPhoto(photo);
    switch (result) {
      case Success():
        emit(UploadPhotoSuccess());
        break;
      case Error():
        emit(UploadPhotoError(message: result.exception.toString()));
        break;
    }
  }
}
