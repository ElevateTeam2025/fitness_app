import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/create_new_password_data_source.dart';
import 'package:fitness_app/features/auth/forget_password/data/data_source/create_new_password_data_source_imp.dart';
import 'package:fitness_app/features/auth/forget_password/data/models/create_new_passwordrequset.dart';
import 'forget_password_remote_data_source_imp_test.mocks.dart';


@GenerateMocks([ApiClient])

void main() {
  late CreateNewPasswordDataSource dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = CreateNewPasswordDataSourceImp(apiClient: mockApiClient);
  });

  group('CreateNewPasswordDataSource', () {
    test('should call ApiClient.createNewPassword with the correct request', () async {
      // Arrange
      final request = CreateNewPasswordrequset(
       email: 'test@example.com',
       newPassword: 'Omar@123',
      );

      when(mockApiClient.createNewPassword(request)).thenAnswer((_) async => Future.value());

      // Act
      await dataSource.createNewPassword(request: request);

      // Assert
      verify(mockApiClient.createNewPassword(request)).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
