
import '../../../../../core/common/result.dart';
import '../../date/model/change_password_request_model.dart';
import '../entity/change_password_entity.dart';


abstract class ChangePasswordRepository {
  Future<Result<ChangePasswordEntity>> changePassword(ChangePasswordRequestModel data);
}
