import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/create_new_password_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateNewPasswordDataSource)
class CreateNewPasswordDataSourceImp implements CreateNewPasswordDataSource {
  final ApiClient _apiClient;

  CreateNewPasswordDataSourceImp({required ApiClient apiClient})
    : _apiClient = apiClient;
  @override
  Future<void> createNewPassword({required CreateNewPasswordrequset request}) {
    return _apiClient.createNewPassword(request);
  }
}
