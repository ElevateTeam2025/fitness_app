import 'package:injectable/injectable.dart';
import '../../../../../core/api/api_client.dart';
import '../model/profile_dto.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileDTO> getProfileData();
  Future<void> logout();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProfileDTO> getProfileData() async {
    return await _apiClient.getProfileData();
  }

  @override
  Future<void> logout() async {
    await _apiClient.logout();
  }
}
