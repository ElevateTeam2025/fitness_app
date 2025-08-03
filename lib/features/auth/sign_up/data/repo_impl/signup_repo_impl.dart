

import 'package:dio/dio.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/sign_up/data/data_source/signup_data_source.dart';
import 'package:fitness_app/features/auth/sign_up/domain/entity/signup_entity.dart';
import 'package:fitness_app/features/auth/sign_up/domain/entity/signup_request_entity.dart';
import 'package:fitness_app/features/auth/sign_up/domain/repo/signup_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';

@Injectable(as:  SignupRepo)
class SignupRepoImp implements SignupRepo{
  final SignupDataSource remoteDataSource;

  SignupRepoImp({required this.remoteDataSource});

  @override
  Future<Result<UserEntity>> signup({required SignupRequestEntity request}) async {
    try {
      final requestModel = request.toModel();
      final response = await remoteDataSource.signup(requestModel);
      final userEntity = response.user.toEntity();
      return Success(userEntity);

    } on DioException catch (dioEx) {
      final failure = ServerFailure.fromResponse(dioEx);
      return Error(failure.errorMessage);

    } catch (e) {

      return Error('Something went wrong, please try again.');
    }
  }
}