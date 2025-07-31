import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source_imp.dart';
import 'forget_password_remote_data_source_imp_test.mocks.dart';


@GenerateMocks([ApiClient])

void main() {
  late ForgetPasswordRemoteDataSource dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = ForgetPasswordRemoteDataSourceImp(apiClient: mockApiClient);
  });

  group('ForgetPasswordRemoteDataSource', () {
    test('should call ApiClient.forgotPassword with the correct request', () async {
      // Arrange
      final request = ForgotPasswordRequest(email: 'test@example.com');

      when(mockApiClient.forgotPassword(request)).thenAnswer((_) async => Future.value());

      // Act
      await dataSource.forgetPassword(request: request);

      // Assert
      verify(mockApiClient.forgotPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
