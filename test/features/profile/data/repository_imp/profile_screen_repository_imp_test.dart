import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fitness_app/features/profile/data/data_source/profile_local_data_source.dart';
import 'package:fitness_app/features/profile/data/repository_imp/profile_screen_repository_imp.dart';
import 'package:fitness_app/features/profile/data/model/profile_dto.dart';
import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';

import 'profile_screen_repository_imp_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSource, ProfileLocalDataSource])
void main() {
  late MockProfileRemoteDataSource mockRemoteDataSource;
  late MockProfileLocalDataSource mockLocalDataSource;
  late ProfileRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockProfileRemoteDataSource();
    mockLocalDataSource = MockProfileLocalDataSource();
    repository = ProfileRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  group('ProfileRepositoryImpl.getProfileData', () {
    test('should return Success with ProfileEntity when remote call succeeds', () async {
      // Arrange
      final mockDto = ProfileDTO(
        message: 'Success',
        user: UserDTO(
          id: '1',
          firstName: 'Test',
          lastName: 'User',
          email: 'test@example.com',
          gender: 'female',
          age: 25,
          weight: 70,
          height: 175,
          activityLevel: 'active',
          goal: 'muscle gain',
          photo: 'https://example.com/photo.jpg',
        ),
      );

      final expectedEntity = mockDto.toEntity();

      when(mockRemoteDataSource.getProfileData()).thenAnswer((_) async => mockDto);

      // Act
      final result = await repository.getProfileData();

      // Assert
      expect(result, isA<Success<ProfileEntity>>());
      expect((result as Success).data, equals(expectedEntity));
      verify(mockRemoteDataSource.getProfileData()).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });

    test('should return Error when remote call throws exception', () async {
      // Arrange
      when(mockRemoteDataSource.getProfileData()).thenThrow(Exception('Network error'));

      // Act
      final result = await repository.getProfileData();

      // Assert
      expect(result, isA<Error<ProfileEntity>>());
      verify(mockRemoteDataSource.getProfileData()).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });

  group('ProfileRepositoryImpl.logout', () {
    test('should call remote logout and local deleteToken and return Success<void>', () async {
      // Arrange
      when(mockRemoteDataSource.logout()).thenAnswer((_) async => Future.value());
      when(mockLocalDataSource.deleteToken()).thenAnswer((_) async => Future.value());

      // Act
      final result = await repository.logout();

      // Assert
      expect(result, isA<Success<void>>());
      verify(mockRemoteDataSource.logout()).called(1);
      verify(mockLocalDataSource.deleteToken()).called(1);
    });

    test('should return Error if remote logout throws exception', () async {
      // Arrange
      when(mockRemoteDataSource.logout()).thenThrow(Exception('Logout failed'));

      // Act
      final result = await repository.logout();

      // Assert
      expect(result, isA<Error<void>>());
      verify(mockRemoteDataSource.logout()).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });

  group('ProfileRepositoryImpl.getToken', () {
    test('should return token from local data source', () async {
      // Arrange
      const token = 'abc123';
      when(mockLocalDataSource.getToken()).thenAnswer((_) async => token);

      // Act
      final result = await repository.getToken();

      // Assert
      expect(result, equals(token));
      verify(mockLocalDataSource.getToken()).called(1);
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });

  group('ProfileRepositoryImpl.deleteToken', () {
    test('should call deleteToken on local data source', () async {
      // Arrange
      when(mockLocalDataSource.deleteToken()).thenAnswer((_) async => Future.value());

      // Act
      await repository.deleteToken();

      // Assert
      verify(mockLocalDataSource.deleteToken()).called(1);
      verifyZeroInteractions(mockRemoteDataSource);
    });
  });
}
