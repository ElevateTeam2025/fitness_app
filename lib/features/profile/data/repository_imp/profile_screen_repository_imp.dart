import 'package:fitness_app/core/services/shared_preference_services.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/result.dart';
import '../../../../core/api/api_execute.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_screen_repository.dart';
import '../data_source/profile_local_data_source.dart';
import '../data_source/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;

  ProfileRepositoryImpl(
    this._profileRemoteDataSource,
    this._profileLocalDataSource,
  );

  @override
  Future<Result<ProfileEntity>> getProfileData() async {
    return executeApi(() async {
      var data = await _profileRemoteDataSource.getProfileData();
      SharedPreferenceServices.saveData(AppConstants.firstName, data.user?.firstName??"");
      return data.toEntity();
    });
  }


  @override
  Future<Result<void>> logout() async {
    return executeApi<void>(() async {
      await _profileRemoteDataSource.logout();
      await _profileLocalDataSource.deleteToken();
    });
  }

  @override
  Future<String?> getToken() async {
    return await _profileLocalDataSource.getToken();
  }

  @override
  Future<void> deleteToken() async {
    await _profileLocalDataSource.deleteToken();
  }

}
