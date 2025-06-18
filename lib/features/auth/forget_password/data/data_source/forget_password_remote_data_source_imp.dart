import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImp
    implements ForgetPasswordRemoteDataSource {
  final ApiClient _apiClient;

  ForgetPasswordRemoteDataSourceImp({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<void> forgetPassword({required ForgotPasswordRequest request}) {
    return _apiClient.forgotPassword(request);
  }
}
