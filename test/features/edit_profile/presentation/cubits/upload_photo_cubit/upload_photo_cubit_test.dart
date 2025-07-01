import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/domain/repo/upload_photo_repo.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_cubit.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/upload_photo_cubit/upload_photo_states.dart';

import 'upload_photo_cubit_test.mocks.dart';

@GenerateMocks([UploadPhotoRepo])
void main() {
  late MockUploadPhotoRepo mockRepo;
  late UploadPhotoCubit cubit;

  final file = File('dummy_path/sample.jpg');

  // Register dummy to avoid MissingDummyValueError
  provideDummy<Result<void>>(Success(null));

  setUp(() {
    mockRepo = MockUploadPhotoRepo();
    cubit = UploadPhotoCubit(mockRepo);
  });

  tearDown(() => cubit.close());

  group('UploadPhotoCubit', () {
    blocTest<UploadPhotoCubit, UploadPhotoStates>(
      'emits [Loading, Success] when upload succeeds',
      build: () {
        when(mockRepo.uploadPhoto(file)).thenAnswer((_) async => Success(null));
        return cubit;
      },
      act: (cubit) => cubit.uploadPhoto(file),
      expect: () => [
        isA<UploadPhotoLoading>(),
        isA<UploadPhotoSuccess>(),
      ],
      verify: (_) {
        verify(mockRepo.uploadPhoto(file)).called(1);
        verifyNoMoreInteractions(mockRepo);
      },
    );

    blocTest<UploadPhotoCubit, UploadPhotoStates>(
      'emits [Loading, Error] when upload fails',
      build: () {
        when(mockRepo.uploadPhoto(file)).thenAnswer(
          (_) async => Error(('Upload failed')),
        );
        return cubit;
      },
      act: (cubit) => cubit.uploadPhoto(file),
      expect: () => [
        isA<UploadPhotoLoading>(),
        isA<UploadPhotoError>().having(
          (e) => e.message,
          'message',
          contains('Upload failed'),
        ),
      ],
      verify: (_) {
        verify(mockRepo.uploadPhoto(file)).called(1);
        verifyNoMoreInteractions(mockRepo);
      },
    );
  });
}
