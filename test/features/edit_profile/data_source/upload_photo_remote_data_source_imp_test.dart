import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/edit_profile/data/data_source/upload_photo_remote_data_source.dart';
import 'package:fitness_app/features/edit_profile/data/data_source/upload_photo_remote_data_source_imp.dart';
import '../../auth/forget_password/data/data_source/forget_password_remote_data_source_imp_test.mocks.dart';


@GenerateMocks([ApiClient])
void main() {
  late UploadPhotoRemoteDataSource dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = UploadPhotoRemoteDataSourceImp(apiClient: mockApiClient);
  });

  group('UploadPhotoRemoteDataSourceImp', () {
    test('calls ApiClient.uploadPhoto with the correct FormData', () async {
      // Arrange
      final formData = FormData();

      when(mockApiClient.uploadPhoto(formData)).thenAnswer((_) async {});

      // Act
      await dataSource.uploadPhoto(formData);

      // Assert
      verify(mockApiClient.uploadPhoto(formData)).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });

    test('throws Exception when ApiClient.uploadPhoto throws', () async {
      // Arrange
      final formData = FormData();
      when(mockApiClient.uploadPhoto(formData))
          .thenThrow(Exception('Upload failed'));

      // Act & Assert
      expect(() => dataSource.uploadPhoto(formData), throwsA(isA<Exception>()));
      verify(mockApiClient.uploadPhoto(formData)).called(1);
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
