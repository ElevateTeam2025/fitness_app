import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fitness_app/features/edit_profile/data/repo_imp/upload_photo_repo_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/edit_profile/data/data_source/upload_photo_remote_data_source.dart';
import 'package:fitness_app/features/edit_profile/domain/repo/upload_photo_repo.dart';
import 'upload_photo_repo_imp_test.mocks.dart';

@GenerateMocks([UploadPhotoRemoteDataSource])
void main() {
  late UploadPhotoRepo repo;
  late MockUploadPhotoRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockUploadPhotoRemoteDataSource();
    repo = UploadPhotoRepoImp(mockRemoteDataSource);
  });

  group('UploadPhotoRepoImp', () {
    late File testFile;

    setUp(() async {
      // Create dummy image file
      final dir = Directory.systemTemp.createTempSync();
      testFile = File('${dir.path}/sample.jpg');
      await testFile.writeAsBytes([0xFF, 0xD8, 0xFF]); // Dummy JPEG header bytes
    });

    test('returns Success<void> when uploadPhoto completes successfully', () async {
      // Arrange
      when(mockRemoteDataSource.uploadPhoto(any)).thenAnswer((_) async {});

      // Act
      final result = await repo.uploadPhoto(testFile);

      // Assert
      expect(result, isA<Success<void>>());
      verify(mockRemoteDataSource.uploadPhoto(any)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('returns Failure when uploadPhoto throws an exception', () async {
      // Arrange
      when(mockRemoteDataSource.uploadPhoto(any))
          .thenThrow(Exception('Upload failed'));

      // Act
      final result = await repo.uploadPhoto(testFile);

      // Assert
      expect(result, isA<Error>());
      verify(mockRemoteDataSource.uploadPhoto(any)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
