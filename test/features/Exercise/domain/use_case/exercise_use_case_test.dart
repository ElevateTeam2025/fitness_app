import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/domain/repository/exercise_repository.dart';
import 'package:fitness_app/features/Exercise/domain/use_case/exercise_use_case.dart';

import 'exercise_use_case_test.mocks.dart';

@GenerateMocks([ExerciseRepository])
void main() {
  late ExercisesUseCase useCase;
  late MockExerciseRepository mockRepository;

  // ✅ Provide dummy values to avoid MissingDummyValueError
  provideDummy<Result<ExerciseResponseEntity>>(Success(ExerciseResponseEntity(exercises: [])));
  provideDummy<Result<List<DifficultyLevelEntity>>>(Success([]));

  setUp(() {
    mockRepository = MockExerciseRepository();
    useCase = ExercisesUseCase(mockRepository);
  });

  group('ExercisesUseCase.call', () {
    test('should return ExerciseResponseEntity when repository succeeds', () async {
      const muscleId = '1';
      const difficultyId = '2';
      final expected = Success(ExerciseResponseEntity(exercises: []));

      when(mockRepository.getExercises(muscleId, difficultyId))
          .thenAnswer((_) async => expected);

      final result = await useCase.call(muscleId, difficultyId);

      expect(result, equals(expected));
      verify(mockRepository.getExercises(muscleId, difficultyId)).called(1);
    });

    test('should return failure when repository fails', () async {
      const muscleId = '1';
      const difficultyId = '2';
      final error = Error<ExerciseResponseEntity>('Failed');
      provideDummy<Result<ExerciseResponseEntity>>(error); // optional redundancy

      when(mockRepository.getExercises(muscleId, difficultyId))
          .thenAnswer((_) async => error);

      final result = await useCase.call(muscleId, difficultyId);

      expect(result, equals(error));
      verify(mockRepository.getExercises(muscleId, difficultyId)).called(1);
    });
  });

  group('ExercisesUseCase.getLevels', () {
    test('should return list of levels when repository succeeds', () async {
      final levels = [DifficultyLevelEntity(id: '1', name: 'Beginner')];
      final expected = Success<List<DifficultyLevelEntity>>(levels);
      provideDummy<Result<List<DifficultyLevelEntity>>>(expected);

      when(mockRepository.getLevels()).thenAnswer((_) async => expected);

      final result = await useCase.getLevels();

      expect(result, equals(expected));
      verify(mockRepository.getLevels()).called(1);
    });

    test('should return failure when repository fails', () async {
      final error = Error<List<DifficultyLevelEntity>>('Failed to get levels');
      provideDummy<Result<List<DifficultyLevelEntity>>>(error);

      when(mockRepository.getLevels()).thenAnswer((_) async => error);

      final result = await useCase.getLevels();

      expect(result, equals(error));
      verify(mockRepository.getLevels()).called(1);
    });
  });
}
