import 'package:fitness_app/features/Exercise/data/repository_imp/exercise_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/Exercise/data/data_source/exercise_remote_data_source.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/data/model/exercise_dto.dart';
import 'package:fitness_app/features/Exercise/data/model/difficult_level_dto.dart';


import 'exercise_repository_imp_test.mocks.dart';

@GenerateMocks([ExerciseRemoteDataSource])
void main() {
  late ExerciseRepositoryImpl repository;
  late MockExerciseRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockExerciseRemoteDataSource();
    repository = ExerciseRepositoryImpl(mockRemoteDataSource);
  });

  group('ExerciseRepositoryImpl', () {
    group('getExercises', () {
      test('should return Success with ExerciseResponseEntity when remote call succeeds', () async {
        // Arrange
        const muscleId = '1';
        const difficultyId = '2';

        final dto = ExerciseResponseDTO(exercises: []);
        final entity = ExerciseResponseEntity(exercises: []);

        when(mockRemoteDataSource.getExercises(muscleId, difficultyId))
            .thenAnswer((_) async => dto);

        // افتراض وجود دالة toEntity() على DTO:
        // يمكنك عمل mock عليها أو إذا هي دالة عادية تتحول مباشرة، تستخدم dto.toEntity()
        // هنا نفترض أنها ترجّع entity مباشرة:
        // لذلك نحتاج إما عمل Fake أو استخدام DTO حقيقي مع toEntity.

        // Act
        final result = await repository.getExercises(muscleId, difficultyId);

        // Assert
        expect(result, isA<Success<ExerciseResponseEntity>>());
        expect((result as Success).data, isA<ExerciseResponseEntity>());
        verify(mockRemoteDataSource.getExercises(muscleId, difficultyId)).called(1);
      });

      test('should return Error when remote call throws exception', () async {
        // Arrange
        const muscleId = '1';
        const difficultyId = '2';

        when(mockRemoteDataSource.getExercises(muscleId, difficultyId))
            .thenThrow(Exception('Network Error'));

        // Act
        final result = await repository.getExercises(muscleId, difficultyId);

        // Assert
        expect(result, isA<Error<ExerciseResponseEntity>>());
        verify(mockRemoteDataSource.getExercises(muscleId, difficultyId)).called(1);
      });
    });

    group('getLevels', () {
      test('should return Success with list of DifficultyLevelEntity when remote call succeeds', () async {
        // Arrange
        final dto = [
          DifficultyLevelDTO(id: '1', name: 'Beginner'),
          DifficultyLevelDTO(id: '2', name: 'Intermediate'),
        ];
        final entities = dto.map((dto) => dto.toEntity()).toList();

        when(mockRemoteDataSource.getLevels()).thenAnswer((_) async => dto);

        // Act
        final result = await repository.getLevels();

        // Assert
        expect(result, isA<Success<List<DifficultyLevelEntity>>>());
        expect((result as Success).data, entities);
        verify(mockRemoteDataSource.getLevels()).called(1);
      });

      test('should return Error when remote call throws exception', () async {
        // Arrange
        when(mockRemoteDataSource.getLevels()).thenThrow(Exception('Server Error'));

        // Act
        final result = await repository.getLevels();

        // Assert
        expect(result, isA<Error<List<DifficultyLevelEntity>>>());
        verify(mockRemoteDataSource.getLevels()).called(1);
      });
    });
  });
}
