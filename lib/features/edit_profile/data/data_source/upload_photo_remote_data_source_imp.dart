import 'package:dio/dio.dart';
import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/edit_profile/data/data_source/upload_photo_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UploadPhotoRemoteDataSource)
class UploadPhotoRemoteDataSourceImp implements UploadPhotoRemoteDataSource {
  final ApiClient _apiClient;

  UploadPhotoRemoteDataSourceImp({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<void> uploadPhoto(FormData photo) async {
    return await _apiClient.uploadPhoto(photo);
  }
}
