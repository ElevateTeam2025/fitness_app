import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/domain/entites/edit_profile_response_entity.dart';
import 'package:fitness_app/features/edit_profile/domain/repo/edit_profile_repo.dart';

class EditProfileUseCase {
  final EditProfileRepo _editProfileRepository;

  EditProfileUseCase(this._editProfileRepository);

  Future<Result<EditProfileResponseEntity>> execute(
    Map<String, dynamic> data,
  ) async {
    return await _editProfileRepository.editProfile(data);
  }
}
