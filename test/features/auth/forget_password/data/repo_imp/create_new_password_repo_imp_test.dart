import 'package:fitness_app/features/auth/forget_password/data/repo_imp/create_new_password_repo_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/create_new_password_data_source.dart';

import 'create_new_password_repo_imp_test.mocks.dart';

/// 👇 Generate mocks
@GenerateMocks([CreateNewPasswordDataSource])
void main() {
  late CreateNewPasswordRepoImp repo;
  late MockCreateNewPasswordDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockCreateNewPasswordDataSource();
    repo = CreateNewPasswordRepoImp(
      createNewPasswordDataSource: mockDataSource,
    );
  });

  group('CreateNewPasswordRepo', () {
    test('should return Success when data source call succeeds', () async {
      // Arrange
      final request = CreateNewPasswordrequset(
        email: 'test@example.com',
        newPassword: 'Omar@123',
      );

      when(
        mockDataSource.createNewPassword(request: request),
      ).thenAnswer((_) async => Future.value());

      // Act
      final result = await repo.createNewPassword(request: request);

      // Assert
      expect(result, isA<Success<void>>());
      verify(mockDataSource.createNewPassword(request: request)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return Error when data source throws an exception', () async {
      // Arrange
      final request = CreateNewPasswordrequset(
        email: 'test@example.com',
        newPassword: 'Omar@123',
      );

      when(
        mockDataSource.createNewPassword(request: request),
      ).thenThrow(Exception('Something went wrong'));

      // Act
      final result = await repo.createNewPassword(request: request);

      // Assert
      expect(result, isA<Error<void>>());
      final error = result as Error<void>;
      expect(error.exception.toString().toLowerCase(), contains('something'));

      verify(mockDataSource.createNewPassword(request: request)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
