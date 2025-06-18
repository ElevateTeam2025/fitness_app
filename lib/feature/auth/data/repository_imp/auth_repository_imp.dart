import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../../../core/api/api_execute.dart';
import '../../../../core/common/result.dart';
import '../../domain/entity/sign_in_entity.dart';
import '../../domain/entity/sign_in_request.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_data_source.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/sign_in_dto.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(
      this._authRemoteDataSource,
      this._authLocalDataSource,
      );

  @override
  Future<Result<SignInEntity>> signIn(SignInRequest data) async {
    return await executeApi(() async {
      final SignInDTO response = await _authRemoteDataSource.signIn(data);
      await _authLocalDataSource.saveToken(response.token!);
      log('Token: ${response.token}');
      return response.toEntity();
    });
  }

  @override
  Future<void> saveToken(String token) async {
    await _authLocalDataSource.saveToken(token);
  }
}
