import 'package:json_annotation/json_annotation.dart';

part 'exercise_response_dto.g.dart';

@JsonSerializable()
class ExerciseResponseDTO {
  final String message;
  final int totalExercises;
  final List<ExerciseDTO> exercises;

  ExerciseResponseDTO({
    required this.message,
    required this.totalExercises,
    required this.exercises,
  });

  factory ExerciseResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ExerciseResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseResponseDTOToJson(this);
}

@JsonSerializable()
class ExerciseDTO {
  @JsonKey(name: '_id')
  final String id;
  final String exercise;
  final String shortYoutubeDemonstration;
  final String? inDepthYoutubeExplanation;
  final String difficultyLevel;
  final String targetMuscleGroup;
  final String primeMoverMuscle;
  final String? secondaryMuscle;
  final String? tertiaryMuscle;
  final String primaryEquipment;
  @JsonKey(name: '_primary_items')
  final int primaryItems;
  final String? secondaryEquipment;
  @JsonKey(name: '_secondary_items')
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
  final String? inDepthYoutubeExplanationLink;

  ExerciseDTO({
    required this.id,
    required this.exercise,
    required this.shortYoutubeDemonstration,
    this.inDepthYoutubeExplanation,
    required this.difficultyLevel,
    required this.targetMuscleGroup,
    required this.primeMoverMuscle,
    this.secondaryMuscle,
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
    this.inDepthYoutubeExplanationLink,
  });

  factory ExerciseDTO.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseDTOToJson(this);
}
