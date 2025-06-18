import 'package:dio/dio.dart';
import 'package:fitness_app/feature/auth/domain/entity/sign_in_request.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../feature/auth/data/model/sign_in_dto.dart';
import '../utils/end_points.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: baseUrl)
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

// ///////////////////++++++++++++++++/////////////////
// ///////////////////    Auth api    /////////////////
// ///////////////////++++++++++++++++/////////////////
//
  @POST(ApiEndPoints.signIn)
  Future<SignInDTO> signIn(@Body() SignInRequest data);
}
