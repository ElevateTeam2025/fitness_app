import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/features/profile/data/data_source/profile_local_data_source.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';

import 'profile_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ProfileLocalDataSourceImpl dataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProfileLocalDataSourceImpl(mockSharedPreferences);
  });

  const tToken = 'test_token';

  group('ProfileLocalDataSourceImpl', () {
    test('cacheToken should call SharedPreferences.setString with correct key and value', () async {
      // Arrange
      when(mockSharedPreferences.setString(AppConstants.token, tToken))
          .thenAnswer((_) async => true);

      // Act
      await dataSource.cacheToken(tToken);

      // Assert
      verify(mockSharedPreferences.setString(AppConstants.token, tToken)).called(1);
    });

    test('getToken should return token from SharedPreferences', () async {
      // Arrange
      when(mockSharedPreferences.getString(AppConstants.token)).thenReturn(tToken);

      // Act
      final result = await dataSource.getToken();

      // Assert
      expect(result, tToken);
      verify(mockSharedPreferences.getString(AppConstants.token)).called(1);
    });

    test('deleteToken should call SharedPreferences.remove with correct key', () async {
      // Arrange
      when(mockSharedPreferences.remove(AppConstants.token)).thenAnswer((_) async => true);

      // Act
      await dataSource.deleteToken();

      // Assert
      verify(mockSharedPreferences.remove(AppConstants.token)).called(1);
    });
  });
}
