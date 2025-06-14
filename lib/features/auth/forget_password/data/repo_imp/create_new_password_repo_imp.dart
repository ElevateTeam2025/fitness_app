import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/create_new_password_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repo/create_new_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateNewPasswordRepo)
class CreateNewPasswordRepoImp implements CreateNewPasswordRepo {
  final CreateNewPasswordDataSource _createNewPasswordDataSource;

  CreateNewPasswordRepoImp({
    required CreateNewPasswordDataSource createNewPasswordDataSource,
  }) : _createNewPasswordDataSource = createNewPasswordDataSource;

  @override
  Future<Result> createNewPassword({
    required CreateNewPasswordrequset request,
  }) async {
    return await executeApi(
      () => _createNewPasswordDataSource.createNewPassword(request: request),
    );
  }
}
