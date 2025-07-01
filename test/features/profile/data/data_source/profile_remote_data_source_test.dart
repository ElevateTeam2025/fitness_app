import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fitness_app/features/profile/data/model/profile_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'profile_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late ProfileRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = ProfileRemoteDataSourceImpl(mockApiClient);
  });

  group('ProfileRemoteDataSourceImpl', () {
    test('getProfileData should return ProfileDTO from ApiClient', () async {
      // Arrange
      final mockProfileDTO = ProfileDTO(
        message: 'Success',
        user: UserDTO(
          id: '1',
          firstName: 'Test',
          lastName: 'User',
          email: 'test@example.com',
          gender: 'male',
          age: 25,
          weight: 70,
          height: 175,
          activityLevel: 'active',
          goal: 'muscle gain',
          photo: 'https://example.com/photo.jpg',
        ),
      );

      when(mockApiClient.getProfileData())
          .thenAnswer((_) async => mockProfileDTO);

      // Act
      final result = await dataSource.getProfileData();

      // Assert
      expect(result, equals(mockProfileDTO));
      verify(mockApiClient.getProfileData()).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });

    test('logout should call ApiClient.logout and complete', () async {

      final dioResponse = Response<void>(
        data: null,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/logout'),
      );
      final httpResponse = HttpResponse<void>(dioResponse.data, dioResponse);

      when(mockApiClient.logout()).thenAnswer((_) async => httpResponse);

      await dataSource.logout();

      verify(mockApiClient.logout()).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
