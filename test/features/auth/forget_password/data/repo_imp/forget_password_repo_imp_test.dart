import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/repo_imp/forget_password_repo_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_repo_imp_test.mocks.dart';

/// 👇 Generate mocks
@GenerateMocks([ForgetPasswordRemoteDataSource])
void main() {
  late ForgetPasswordRepoImp repo;
  late MockForgetPasswordRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockForgetPasswordRemoteDataSource();
    repo = ForgetPasswordRepoImp(
      forgetPasswordRemoteDataSource: mockRemoteDataSource,
    );
  });

  group('ForgetPasswordRepo', () {
    test('should return Success when remote data source succeeds', () async {
      // Arrange
      final request = ForgotPasswordRequest(email: 'test@example.com');

      when(
        mockRemoteDataSource.forgetPassword(request: request),
      ).thenAnswer((_) async => Future.value());

      // Act
      final result = await repo.forgetPassword(request: request);

      // Assert
      expect(result, isA<Success>());
      verify(mockRemoteDataSource.forgetPassword(request: request)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Error when remote call throws an exception', () async {
      // Arrange
      final request = ForgotPasswordRequest(email: 'test@example.com');
      when(
        mockRemoteDataSource.forgetPassword(request: request),
      ).thenThrow(Exception('Network error'));

      // Act
      final result = await repo.forgetPassword(request: request);

      // Assert
      expect(result, isA<Error<void>>());
      // You can also assert on the message if your Error class includes one
      final error = result as Error<void>;
      expect(error.exception.toString().toLowerCase(), contains('network'));

      verify(mockRemoteDataSource.forgetPassword(request: request)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
