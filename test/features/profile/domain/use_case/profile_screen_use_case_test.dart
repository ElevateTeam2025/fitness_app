import 'package:fitness_app/features/profile/domain/repository/profile_screen_repository.dart';
import 'package:fitness_app/features/profile/domain/use_case/profile_screen_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:fitness_app/core/common/result.dart';

import 'profile_screen_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  provideDummy<Result<ProfileEntity>>(Success(ProfileEntity()));
  provideDummy<Result<void>>(Success(null));

  late MockProfileRepository mockRepository;
  late ProfileUseCase useCase;
  setUp(() {
    mockRepository = MockProfileRepository();
    useCase = ProfileUseCase(mockRepository);
  });

  group('ProfileUseCase', () {
    test('execute should return profile data from repository', () async {
      final mockProfile = ProfileEntity(
        message: 'Success',
        user: UserData(
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

      when(mockRepository.getProfileData())
          .thenAnswer((_) async => Success(mockProfile));

      final result = await useCase.execute();

      expect(result, isA<Success<ProfileEntity>>());
      expect((result as Success).data, mockProfile);
      verify(mockRepository.getProfileData()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('callLogout should call repository.logout and return result', () async {
      when(mockRepository.logout())
          .thenAnswer((_) async => Success<void>(null));

      final result = await useCase.callLogout();

      expect(result, isA<Success<void>>());
      expect((result as Success).data, null);
      verify(mockRepository.logout()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('getToken should call repository.getToken and return token', () async {
      // Arrange
      const token = 'abc123';
      when(mockRepository.getToken()).thenAnswer((_) async => token);

      // Act
      final result = await useCase.getToken();

      // Assert
      expect(result, equals(token));
      verify(mockRepository.getToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('deleteToken should call repository.deleteToken', () async {
      // Arrange
      when(mockRepository.deleteToken()).thenAnswer((_) async => Future.value());
      // Act
      await useCase.deleteToken();
      // Assert
      verify(mockRepository.deleteToken()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
