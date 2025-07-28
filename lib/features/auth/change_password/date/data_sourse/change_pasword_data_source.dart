import 'dart:developer';


import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_client.dart';
import '../../../../../core/api/api_execute.dart';
import '../../../../../core/common/result.dart';
import '../../../../../core/services/shared_preference_services.dart';
import '../../../../../core/utils/constant_manager.dart';
import '../../domin/entity/change_password_entity.dart';
import '../model/change_password_request_model.dart';


abstract class ChangePasswordDataSource {
  Future<Result<ChangePasswordEntity>> changePassword(
      ChangePasswordRequestModel data,
      );
}
@Injectable(as: ChangePasswordDataSource)
class ChangePasswordDataSourceImp implements ChangePasswordDataSource  {
  final ApiClient _apiClient;

  ChangePasswordDataSourceImp(this._apiClient);
  @override
  Future<Result<ChangePasswordEntity>> changePassword(
      ChangePasswordRequestModel data,
      ) async{
    var token=  SharedPreferenceServices.getData(AppConstants.token.toString());
    return executeApi(() async{
      var response = await _apiClient.changePassword(data,"Bearer $token");
      log("response ${response.message}");
      return response;
    },);
  }
}

