import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/create_new_password_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';
import 'package:fitness_app/features/forgert_password/data/data_source/reset_new_password_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetNewPasswordDataSource)
class ResetNewPasswordDataSourceImp implements ResetNewPasswordDataSource {
  final ApiClient _apiClient;

  ResetNewPasswordDataSourceImp({required ApiClient apiClient})
    : _apiClient = apiClient;
  @override
  Future<void> resetNewPassword({required ResetNewPasswordrequset request}) {
    return _apiClient.changePassword(request);
  }


}
