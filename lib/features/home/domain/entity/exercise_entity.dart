import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final String id;
  final String exercise;
  final String shortYoutubeDemonstration;
  final String inDepthYoutubeExplanation;
  final String difficultyLevel;
  final String targetMuscleGroup;
  final String primeMoverMuscle;
  final String? tertiaryMuscle;
  final String primaryEquipment;
  final int primaryItems;
  final String? secondaryEquipment;
  final int secondaryItems;
  final String posture;
  final String singleOrDoubleArm;
  final String continuousOrAlternatingArms;
  final String grip;
  final String loadPositionEnding;
  final String continuousOrAlternatingLegs;
  final String footElevation;
  final String combinationExercises;
  final String movementPattern1;
  final String? movementPattern2;
  final String? movementPattern3;
  final String planeOfMotion1;
  final String? planeOfMotion2;
  final String? planeOfMotion3;
  final String bodyRegion;
  final String forceType;
  final String mechanics;
  final String laterality;
  final String primaryExerciseClassification;
  final String shortYoutubeDemonstrationLink;
  final String inDepthYoutubeExplanationLink;

  const ExerciseEntity({
    required this.id,
    required this.exercise,
    required this.shortYoutubeDemonstration,
    required this.inDepthYoutubeExplanation,
    required this.difficultyLevel,
    required this.targetMuscleGroup,
    required this.primeMoverMuscle,
    this.tertiaryMuscle,
    required this.primaryEquipment,
    required this.primaryItems,
    this.secondaryEquipment,
    required this.secondaryItems,
    required this.posture,
    required this.singleOrDoubleArm,
    required this.continuousOrAlternatingArms,
    required this.grip,
    required this.loadPositionEnding,
    required this.continuousOrAlternatingLegs,
    required this.footElevation,
    required this.combinationExercises,
    required this.movementPattern1,
    this.movementPattern2,
    this.movementPattern3,
    required this.planeOfMotion1,
    this.planeOfMotion2,
    this.planeOfMotion3,
    required this.bodyRegion,
    required this.forceType,
    required this.mechanics,
    required this.laterality,
    required this.primaryExerciseClassification,
    required this.shortYoutubeDemonstrationLink,
    required this.inDepthYoutubeExplanationLink,
  });

  @override
  List<Object?> get props => [
    id,
    exercise,
    shortYoutubeDemonstration,
    inDepthYoutubeExplanation,
    difficultyLevel,
    targetMuscleGroup,
    primeMoverMuscle,
    tertiaryMuscle,
    primaryEquipment,
    primaryItems,
    secondaryEquipment,
    secondaryItems,
    posture,
    singleOrDoubleArm,
    continuousOrAlternatingArms,
    grip,
    loadPositionEnding,
    continuousOrAlternatingLegs,
    footElevation,
    combinationExercises,
    movementPattern1,
    movementPattern2,
    movementPattern3,
    planeOfMotion1,
    planeOfMotion2,
    planeOfMotion3,
    bodyRegion,
    forceType,
    mechanics,
    laterality,
    primaryExerciseClassification,
    shortYoutubeDemonstrationLink,
    inDepthYoutubeExplanationLink,
  ];
}
