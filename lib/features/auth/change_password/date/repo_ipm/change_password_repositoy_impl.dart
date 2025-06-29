import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';

import '../../domin/entity/change_password_entity.dart';
import '../../domin/repo/reset_password_repository.dart';
import '../data_sourse/change_pasword_data_source.dart';
import '../model/change_password_request_model.dart';
@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImp implements ChangePasswordRepository {
  final ChangePasswordDataSource _changePasswordDataSource;

  ChangePasswordRepositoryImp(this._changePasswordDataSource);

  @override
  Future<Result<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  ) async{
    return await _changePasswordDataSource.changePassword(data);
  }
}
