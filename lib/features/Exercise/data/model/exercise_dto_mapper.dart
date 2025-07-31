import 'package:fitness_app/features/Exercise/data/model/exercise_dto.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';

extension ExerciseDtoMapper on ExerciseDTO {
  Exercises toEntity() => Exercises(
    id: id,
    exercise: exercise,
    shortYoutubeDemonstration: shortYoutubeDemonstration,
    inDepthYoutubeExplanation: inDepthYoutubeExplanation,
    difficultyLevel: difficultyLevel,
    targetMuscleGroup: targetMuscleGroup,
    primeMoverMuscle: primeMoverMuscle,
    secondaryMuscle: secondaryMuscle,
    tertiaryMuscle: tertiaryMuscle,
    primaryEquipment: primaryEquipment,
    primaryItems: primaryItems,
    secondaryEquipment: secondaryEquipment,
    secondaryItems: secondaryItems,
    posture: posture,
    singleOrDoubleArm: singleOrDoubleArm,
    continuousOrAlternatingArms: continuousOrAlternatingArms,
    grip: grip,
    loadPositionEnding: loadPositionEnding,
    continuousOrAlternatingLegs: continuousOrAlternatingLegs,
    footElevation: footElevation,
    combinationExercises: combinationExercises,
    movementPattern1: movementPattern1,
    movementPattern2: movementPattern2,
    movementPattern3: movementPattern3,
    planeOfMotion1: planeOfMotion1,
    planeOfMotion2: planeOfMotion2,
    planeOfMotion3: planeOfMotion3,
    bodyRegion: bodyRegion,
    forceType: forceType,
    mechanics: mechanics,
    laterality: laterality,
    primaryExerciseClassification: primaryExerciseClassification,
    shortYoutubeDemonstrationLink: shortYoutubeDemonstrationLink,
    inDepthYoutubeExplanationLink: inDepthYoutubeExplanationLink,
  );
}

extension ExerciseResponseDtoMapper on ExerciseResponseDTO {
  ExerciseResponseEntity toEntity() => ExerciseResponseEntity(
    message: message,
    totalExercises: totalExercises,
    totalPages: totalPages,
    currentPage: currentPage,
    exercises: exercises?.map((e) => e.toEntity()).toList(),
  );
}
