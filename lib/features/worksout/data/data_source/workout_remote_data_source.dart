import 'dart:developer';

import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/muscles_data_response_entity.dart';

abstract class WorkoutRemoteDataSource {
  Future<Result<MusclesTebResponseEntity>> getMusclesTab();

  Future<Result<MusclesDataResponseEntity>> getMusclesData(String id);
}

@Injectable(as: WorkoutRemoteDataSource)
class WorkoutRemoteDataSourceImpl implements WorkoutRemoteDataSource {
  final ApiClient _apiClient;

  WorkoutRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<MusclesTebResponseEntity>> getMusclesTab() async {
    return executeApi(() async {
      var response = await _apiClient.getMusclesTabs();
      log(response.toString());
      return response;
    });
  }

  @override
  Future<Result<MusclesDataResponseEntity>> getMusclesData(String id) {
    return executeApi(() async {
      var response = await _apiClient.getMusclesData(id);
      log(response.toString());
      return response;
    });
  }
}
