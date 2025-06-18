import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/verify_reset_code_remote_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:fitness_app/features/auth/forget_password/domain/repo/verify_reset_code_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyResetCodeRepo)
class VerifyResetCodeRepoImp implements VerifyResetCodeRepo {
  final VerifyResetCodeRemoteDataSource _verifyResetCodeRemoteDataSource;

  VerifyResetCodeRepoImp({
    required VerifyResetCodeRemoteDataSource verifyResetCodeRemoteDataSource,
  }) : _verifyResetCodeRemoteDataSource = verifyResetCodeRemoteDataSource;

  @override
  Future<Result> verifyResetCode({
    required VerifyResetCodeRequest request,
  }) async {
    return await executeApi(
      () => _verifyResetCodeRemoteDataSource.verifyResetCode(request: request),
    );
  }
}
