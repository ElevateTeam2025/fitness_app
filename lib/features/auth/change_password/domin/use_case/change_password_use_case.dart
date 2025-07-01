import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/result.dart';

import '../../date/model/change_password_request_model.dart';
import '../entity/change_password_entity.dart';
import '../repo/reset_password_repository.dart';
@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository _changePasswordRepository;

  ChangePasswordUseCase(this._changePasswordRepository);

  Future<Result<ChangePasswordEntity>> execute(
    ChangePasswordRequestModel data,
  ) {
    return _changePasswordRepository.changePassword(data);
  }
}
