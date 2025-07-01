import 'package:dio/dio.dart';

abstract interface class UploadPhotoRemoteDataSource {
  Future<void> uploadPhoto(FormData photo);
}
