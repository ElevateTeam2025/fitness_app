import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/verify_reset_code_remote_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyResetCodeRemoteDataSource)
class VerifyResetCodeRemoteDataSourceImp
    implements VerifyResetCodeRemoteDataSource {
  final ApiClient _apiClient;

  VerifyResetCodeRemoteDataSourceImp({required ApiClient apiClient})
    : _apiClient = apiClient;
  @override
  Future<void> verifyResetCode({required VerifyResetCodeRequest request}) {
    return _apiClient.verifyResetCode(request);
  }
}
