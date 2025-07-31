import 'package:fitness_app/core/api/api_client.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/sign_in_request.dart';
import '../model/sign_in_dto.dart';

abstract class AuthRemoteDataSource {
  Future<SignInDTO> signIn(SignInRequest data);
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<SignInDTO> signIn(SignInRequest data) async {
    return await _apiClient.signIn(data);
  }

}
