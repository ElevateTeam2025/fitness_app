import 'package:fitness_app/features/auth/forget_password/data/repo_imp/verify_reset_code_repo_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/verify_reset_code_remote_data_source.dart';

import 'verify_reset_code_repo_imp_test.mocks.dart';

@GenerateMocks([VerifyResetCodeRemoteDataSource])
void main() {
  late VerifyResetCodeRepoImp repo;
  late MockVerifyResetCodeRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockVerifyResetCodeRemoteDataSource();
    repo = VerifyResetCodeRepoImp(
      verifyResetCodeRemoteDataSource: mockRemoteDataSource,
    );
  });

  group('VerifyResetCodeRepo', () {
    test('should return Success when remote call succeeds', () async {
      // Arrange
      final request = VerifyResetCodeRequest(resetCode: '123456');

      when(
        mockRemoteDataSource.verifyResetCode(request: request),
      ).thenAnswer((_) async => Future.value());

      // Act
      final result = await repo.verifyResetCode(request: request);

      // Assert
      expect(result, isA<Success<void>>());
      verify(mockRemoteDataSource.verifyResetCode(request: request)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Error when remote call throws an exception', () async {
      // Arrange
      final request = VerifyResetCodeRequest(resetCode: '123456');

      when(
        mockRemoteDataSource.verifyResetCode(request: request),
      ).thenThrow(Exception('Invalid code'));

      // Act
      final result = await repo.verifyResetCode(request: request);

      // Assert
      expect(result, isA<Error<void>>());
      final error = result as Error<void>;
      expect(error.exception.toString().toLowerCase(), contains('invalid'));

      verify(mockRemoteDataSource.verifyResetCode(request: request)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
