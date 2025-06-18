import 'package:fitness_app/feature/auth/data/repository_imp/auth_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/feature/auth/data/data_source/auth_local_data_source.dart';
import 'package:fitness_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fitness_app/feature/auth/data/model/sign_in_dto.dart';
import 'package:fitness_app/feature/auth/domain/entity/sign_in_entity.dart';
import 'package:fitness_app/feature/auth/domain/entity/sign_in_request.dart';
import 'package:mockito/mockito.dart' as mockito;

import 'auth_repository_imp_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  late AuthRemoteDataSource remoteDataSource;
  late AuthLocalDataSource localDataSource;
  late AuthRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    localDataSource = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(remoteDataSource, localDataSource);
  });

  group('AuthRepositoryImpl signIn', () {
    final request = SignInRequest(email: 'test@example.com', password: '123456');

    test('should return Success when API call and token save succeed', () async {
      // Arrange
      final dto = SignInDTO(
        message: 'Welcome!',
        token: 'abc123',
        user: UserInfoDTO(
          id: '1',
          firstName: 'Test',
          lastName: 'User',
          email: 'test@example.com',
        ),
      );

      final entity = SignInEntity(
        message: 'Welcome!',
        token: 'abc123',
        user: UserInfo(
          id: '1',
          firstName: 'Test',
          lastName: 'User',
          email: 'test@example.com',
        ),
      );

      final result = Success<SignInEntity>(entity);
      mockito.provideDummy<Result<SignInEntity>>(result);

      when(remoteDataSource.signIn(request)).thenAnswer((_) async => dto);
      when(localDataSource.saveToken('abc123')).thenAnswer((_) async => {});

      // Act
      final response = await repository.signIn(request);

      // Assert
      expect(response, isA<Success<SignInEntity>>());

      final successResult = response as Success<SignInEntity>;
      expect(successResult.data?.token, equals('abc123'));
      expect(successResult.data?.user?.firstName, equals('Test'));

      verify(remoteDataSource.signIn(request)).called(1);
      verify(localDataSource.saveToken('abc123')).called(1);
    });

    test('should return Error when API throws exception', () async {
      mockito.provideDummy<Result<SignInEntity>>(Error('dummy'));

      when(remoteDataSource.signIn(request)).thenThrow(Exception('API Error'));

      final response = await repository.signIn(request);

      expect(response, isA<Error<SignInEntity>>());
      verify(remoteDataSource.signIn(request)).called(1);
    });
  });
}
