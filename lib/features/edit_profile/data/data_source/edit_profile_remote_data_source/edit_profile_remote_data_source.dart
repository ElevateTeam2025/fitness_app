import 'package:fitness_app/features/edit_profile/data/model/edit_profile_response_dto.dart';

abstract class EditProfileRemoteDataSource {
  Future<EditProfileResponseDto> editProfile(Map<String, dynamic> data);
}
