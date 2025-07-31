import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/verify_reset_code_remote_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/verify_reset_code_remote_data_source_imp.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/verify_reset_code_request.dart';

import 'forget_password_remote_data_source_imp_test.mocks.dart';

/// 👇 Generate mock for ApiClient
@GenerateMocks([ApiClient])

void main() {
  late VerifyResetCodeRemoteDataSource dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = VerifyResetCodeRemoteDataSourceImp(apiClient: mockApiClient);
  });

  group('VerifyResetCodeRemoteDataSource', () {
    test('should call ApiClient.verifyResetCode with the correct request', () async {
      // Arrange
      final request = VerifyResetCodeRequest(
       
        resetCode: '234567',
      );

      when(mockApiClient.verifyResetCode(request)).thenAnswer((_) async => Future.value());

      // Act
      await dataSource.verifyResetCode(request: request);

      // Assert
      verify(mockApiClient.verifyResetCode(request)).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
