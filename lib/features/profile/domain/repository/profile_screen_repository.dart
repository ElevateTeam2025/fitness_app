import '../../../../../core/common/result.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<Result<ProfileEntity>> getProfileData();
  Future<Result<void>> logout();
  Future<String?> getToken();
  Future<void> deleteToken();
}
