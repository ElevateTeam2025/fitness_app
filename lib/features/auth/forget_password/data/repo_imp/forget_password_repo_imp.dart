import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImp implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource _forgetPasswordRemoteDataSource;

  ForgetPasswordRepoImp({
    required ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource,
  }) : _forgetPasswordRemoteDataSource = forgetPasswordRemoteDataSource;

  @override
  Future<Result> forgetPassword({
    required ForgotPasswordRequest request,
  }) async {
    return await executeApi<void>(
      () => _forgetPasswordRemoteDataSource.forgetPassword(request: request),
    );
  }
}
