import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/data/data_source/edit_profile_remote_data_source/edit_profile_remote_data_source.dart';
import 'package:fitness_app/features/edit_profile/domain/entites/edit_profile_response_entity.dart';
import 'package:fitness_app/features/edit_profile/domain/repo/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileRemoteDataSource _remoteDataSource;
  EditProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Result<EditProfileResponseEntity>> editProfile(
    Map<String, dynamic> data,
  ) async {
    return await executeApi(() async {
      final response = await _remoteDataSource.editProfile(data);
      return response.toEntity();
    });
  }
}
