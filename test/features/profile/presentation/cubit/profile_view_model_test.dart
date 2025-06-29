import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/features/profile/domain/use_case/profile_screen_use_case.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profile_view_model.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:fitness_app/core/common/result.dart';

import 'profile_view_model_test.mocks.dart';

@GenerateMocks([ProfileUseCase])
void main() {

  provideDummy<Result<ProfileEntity>>(Success(ProfileEntity()));
  provideDummy<Result<void>>(Success(null));

  late MockProfileUseCase mockUseCase;
  late ProfileViewModel viewModel;

  setUp(() {
    mockUseCase = MockProfileUseCase();
    viewModel = ProfileViewModel(mockUseCase);
  });

  group('ProfileViewModel Tests', () {
    test('should emit Loading, then SuccessProfileState on successful getProfile', () async {
      final mockUser = UserData(
        id: '1',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
      );

      final mockProfileEntity = ProfileEntity(
        message: 'Success',
        user: mockUser,
      );

      when(mockUseCase.execute())
          .thenAnswer((_) async => Success(mockProfileEntity));

      final states = <ProfileState>[];
      final subscription = viewModel.stream.listen(states.add);

      // Act
      viewModel.doIntent(ProfileClickedIntent());

      await Future.delayed(Duration.zero); // wait for async completion

      expect(states.length, 2);
      expect(states[0], isA<LoadingProfileState>());
      expect(states[1], isA<SuccessProfileState>());
      expect((states[1] as SuccessProfileState).user, equals(mockUser));

      await subscription.cancel();
    });

    test('should emit Loading, then ErrorProfileState on failed getProfile', () async {
      when(mockUseCase.execute())
          .thenAnswer((_) async => Error('Failed to load profile'));

      final states = <ProfileState>[];
      final subscription = viewModel.stream.listen(states.add);

      viewModel.doIntent(ProfileClickedIntent());
      await Future.delayed(Duration.zero);

      expect(states.length, 2);
      expect(states[0], isA<LoadingProfileState>());
      expect(states[1], isA<ErrorProfileState>());
      expect((states[1] as ErrorProfileState).message, contains('Failed to load profile'));

      await subscription.cancel();
    });

    test('should emit Loading, then LogoutSuccessState on successful logout', () async {
      when(mockUseCase.callLogout())
          .thenAnswer((_) async => Success(null));

      final states = <ProfileState>[];
      final subscription = viewModel.stream.listen(states.add);

      viewModel.doIntent(LogoutClickedIntent());
      await Future.delayed(Duration.zero);

      expect(states.length, 2);
      expect(states[0], isA<LoadingProfileState>());
      expect(states[1], isA<LogoutSuccessState>());

      await subscription.cancel();
    });

    test('should emit Loading, then ErrorProfileState on failed logout', () async {
      when(mockUseCase.callLogout())
          .thenAnswer((_) async => Error('Logout failed'));

      final states = <ProfileState>[];
      final subscription = viewModel.stream.listen(states.add);

       viewModel.doIntent(LogoutClickedIntent());
      await Future.delayed(Duration.zero);

      expect(states.length, 2);
      expect(states[0], isA<LoadingProfileState>());
      expect(states[1], isA<ErrorProfileState>());
      expect((states[1] as ErrorProfileState).message, contains('Logout failed'));

      await subscription.cancel();
    });
  });
}
