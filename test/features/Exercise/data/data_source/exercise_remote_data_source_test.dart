import 'package:fitness_app/features/Exercise/data/model/levels_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/core/api/api_client.dart';
import 'package:fitness_app/features/Exercise/data/data_source/exercise_remote_data_source.dart';
import 'package:fitness_app/features/Exercise/data/model/difficult_level_dto.dart';
import 'package:fitness_app/features/Exercise/data/model/exercise_dto.dart';

import 'exercise_remote_data_source_test.mocks.dart';

// تعريف Mock لـ ApiClient
@GenerateMocks([ApiClient])
void main() {
  late ExerciseRemoteDataSourceImpl dataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = ExerciseRemoteDataSourceImpl(mockApiClient);
  });

  group('ExerciseRemoteDataSourceImpl', () {
    test('getExercises should return ExerciseResponseDTO from ApiClient', () async {
      const muscleId = '1';
      const difficultyId = '2';

      final expectedResponse = ExerciseResponseDTO(
        message: 'Success',
        exercises: [],
      );

      when(mockApiClient.getExercisesByMuscleAndDifficulty(muscleId, difficultyId))
          .thenAnswer((_) async => expectedResponse);

      final result = await dataSource.getExercises(muscleId, difficultyId);

      expect(result, equals(expectedResponse));
      verify(mockApiClient.getExercisesByMuscleAndDifficulty(muscleId, difficultyId)).called(1);
    });

    test('getLevels should return list of DifficultyLevelDTO from ApiClient', () async {
      final levelList = [
        DifficultyLevelDTO(id: '1', name: 'Beginner'),
        DifficultyLevelDTO(id: '2', name: 'Intermediate'),
      ];

      final levelsResponse = LevelsResponseDTO(levels: levelList, message: 'success');

      when(mockApiClient.getLevels())
          .thenAnswer((_) async => levelsResponse);

      final result = await dataSource.getLevels();

      expect(result, equals(levelList));
      verify(mockApiClient.getLevels()).called(1);
    });
  });
}
