import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/data/data_source/upload_photo_remote_data_source.dart';
import 'package:fitness_app/features/edit_profile/domain/repo/upload_photo_repo.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';

@Injectable(as: UploadPhotoRepo)
class UploadPhotoRepoImp implements UploadPhotoRepo {
  final UploadPhotoRemoteDataSource _uploadPhotoRemoteDataSource;

  UploadPhotoRepoImp(
    UploadPhotoRemoteDataSource uploadPhotoRemoteDataSource,
  ) : _uploadPhotoRemoteDataSource = uploadPhotoRemoteDataSource;
  @override
  Future<Result<void>> uploadPhoto(File photo) async {
    return await executeApi<void>(() async {
      final mimeType = lookupMimeType(photo.path);
      var formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(
          photo.path,
          filename:
              'upload_${DateTime.now().millisecondsSinceEpoch}.${photo.path.split('.').last}',
          contentType: MediaType.parse(mimeType!),
        ),
      });

      await _uploadPhotoRemoteDataSource.uploadPhoto(formData);
    });
  }
}
