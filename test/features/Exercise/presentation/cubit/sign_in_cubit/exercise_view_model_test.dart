import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/features/Exercise/presentation/cubit/sign_in_cubit/exercise_state.dart';
import 'package:fitness_app/features/Exercise/presentation/cubit/sign_in_cubit/exercise_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fitness_app/core/common/result.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/domain/use_case/exercise_use_case.dart';

import 'exercise_view_model_test.mocks.dart';

@GenerateMocks([ExercisesUseCase])
void main() {
  late MockExercisesUseCase mockUseCase;
  late ExerciseViewModel viewModel;

  provideDummy<Result<ExerciseResponseEntity>>(Success<ExerciseResponseEntity>(ExerciseResponseEntity(exercises: [])));
  provideDummy<Result<List<DifficultyLevelEntity>>>(Success<List<DifficultyLevelEntity>>([]));


  final muscleId = 'm1';
  final difficultyId = 'd1';

  final exerciseResponseEntity = ExerciseResponseEntity(exercises: []);
  final difficultyLevels = [
    DifficultyLevelEntity(id: '1', name: 'Beginner'),
  ];

  setUp(() {
    mockUseCase = MockExercisesUseCase();
    viewModel = ExerciseViewModel(mockUseCase);
  });

  tearDown(() {
    viewModel.close();
  });

  group('ExerciseViewModel', () {
    blocTest<ExerciseViewModel, ExerciseState>(
      'emits [LoadingExerciseState, SuccessExerciseState] when load exercises succeeds',
      build: () {
        when(mockUseCase(muscleId, difficultyId))
            .thenAnswer((_) async => Success<ExerciseResponseEntity>(exerciseResponseEntity));
        return viewModel;
      },
      act: (vm) => vm.doIntent(LoadExercisesIntent(muscleId, difficultyId)),
      expect: () => [
        isA<LoadingExerciseState>(),
        isA<SuccessExerciseState>().having((state) => state.data, 'data', exerciseResponseEntity),
      ],
    );

    blocTest<ExerciseViewModel, ExerciseState>(
      'emits [LoadingExerciseState, ErrorExerciseState] when load exercises fails',
      build: () {
        when(mockUseCase(muscleId, difficultyId))
            .thenAnswer((_) async => Error<ExerciseResponseEntity>('Failed to load'));
        return viewModel;
      },
      act: (vm) => vm.doIntent(LoadExercisesIntent(muscleId, difficultyId)),
      expect: () => [
        isA<LoadingExerciseState>(),
        isA<ErrorExerciseState>().having((state) => state.message, 'message', 'Failed to load'),
      ],
    );

    blocTest<ExerciseViewModel, ExerciseState>(
      'emits [LoadingLevelsState, SuccessLevelsState] when load levels succeeds',
      build: () {
        when(mockUseCase.getLevels())
            .thenAnswer((_) async => Success<List<DifficultyLevelEntity>>(difficultyLevels));
        return viewModel;
      },
      act: (vm) => vm.doIntent(LoadLevelsIntent()),
      expect: () => [
        isA<LoadingLevelsState>(),
        isA<SuccessLevelsState>().having((state) => state.levels, 'data', difficultyLevels),
      ],
    );

    blocTest<ExerciseViewModel, ExerciseState>(
      'emits [LoadingLevelsState, ErrorLevelsState] when load levels fails',
      build: () {
        when(mockUseCase.getLevels())
            .thenAnswer((_) async => Error<List<DifficultyLevelEntity>>('Failed to load levels'));
        return viewModel;
      },
      act: (vm) => vm.doIntent(LoadLevelsIntent()),
      expect: () => [
        isA<LoadingLevelsState>(),
        isA<ErrorLevelsState>().having((state) => state.message, 'message', 'Failed to load levels'),
      ],
    );
  });
}
