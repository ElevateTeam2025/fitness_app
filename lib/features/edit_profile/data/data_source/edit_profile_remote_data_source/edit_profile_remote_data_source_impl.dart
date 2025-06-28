import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/edit_profile/data/data_source/edit_profile_remote_data_source/edit_profile_remote_data_source.dart';
import 'package:fitness_app/features/edit_profile/data/model/edit_profile_response_dto.dart';

class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  final ApiClient _apiClient;
  EditProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<EditProfileResponseDto> editProfile(Map<String, dynamic> data) async {
    return await _apiClient.editProfile(data);
  }
}
