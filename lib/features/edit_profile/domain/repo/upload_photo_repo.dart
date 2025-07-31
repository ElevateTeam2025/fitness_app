import 'dart:io';

import 'package:fitness_app/core/common/result.dart';

abstract interface class UploadPhotoRepo {
  Future<Result<void>> uploadPhoto(File photo);
}
