
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_client.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

abstract class SignupDataSource{

  Future<SignupResponseModel> signup(SignupRequestModel request);
}


@Injectable(as: SignupDataSource)
class SignupRemoteDataSourceImpl implements SignupDataSource {
  final ApiClient apiService;

  SignupRemoteDataSourceImpl(this.apiService);

  @override
  Future<SignupResponseModel> signup(SignupRequestModel request) {
    return apiService.signup(request);
  }
}