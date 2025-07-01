import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/domain/entites/edit_profile_response_entity.dart';

abstract class EditProfileRepo {
  Future<Result<EditProfileResponseEntity>> editProfile(
    Map<String, dynamic> data,
  );
}
