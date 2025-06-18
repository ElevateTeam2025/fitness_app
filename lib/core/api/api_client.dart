import 'package:dio/dio.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:fitness_app/features/auth/sign_in/data/model/sign_in_dto.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_request.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/auth/sign_up/data/models/signup_request_model.dart';
import '../../features/auth/sign_up/data/models/signup_response_model.dart';

import '../utils/end_points.dart';

part 'api_client.g.dart';

// @RestApi(baseUrl: 'https://fitness.elevateegy.com/api/v1')
@RestApi(baseUrl: baseUrl)
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

// ///////////////////++++++++++++++++/////////////////
// ///////////////////    Auth api    /////////////////
// ///////////////////++++++++++++++++/////////////////

  @POST(ApiEndPoints.signIn)
  Future<SignInDTO> signIn(@Body() SignInRequest data);

  @POST(ApiEndPoints.forgotPassword)
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST(ApiEndPoints.verifyResetCode)
  Future<void> verifyResetCode(@Body() VerifyResetCodeRequest request);

  @POST(ApiEndPoints.signUp)
  Future<SignupResponseModel> signup(@Body() SignupRequestModel body);
}
