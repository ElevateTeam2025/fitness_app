import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/feature/auth/data/model/sign_in_dto.dart';
import 'package:fitness_app/feature/auth/domain/entity/sign_in_request.dart';

import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = AuthRemoteDataSourceImpl(mockApiClient);
  });

  group('AuthRemoteDataSourceImpl', () {
    final request = SignInRequest(email: 'test@example.com', password: 'password123');

    final signInDto = SignInDTO(
      message: 'Welcome!',
      token: 'abc123',
      user: UserInfoDTO(
        id: '11',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
      ),
    );

    test('should call ApiClient.signIn and return SignInDTO', () async {
      // Arrange
      when(mockApiClient.signIn(request)).thenAnswer((_) async => signInDto);

      // Act
      final result = await dataSource.signIn(request);

      // Assert
      expect(result.token, 'abc123');
      expect(result.user?.firstName, 'Test');
      verify(mockApiClient.signIn(request)).called(1);
    });
  });
}
