class ExercisesResponseEntity {
  ExercisesResponseEntity({
    this.message,
    this.totalExercises,
    this.totalPages,
    this.currentPage,
    this.exercises,});

  String? message;
  num? totalExercises;
  num? totalPages;
  num? currentPage;
  List<Exercises>? exercises;
}

class Exercises {
  Exercises({
    this.id,
    this.exercise,
    this.shortYoutubeDemonstration,
    this.inDepthYoutubeExplanation,
    this.difficultyLevel,
    this.targetMuscleGroup,
    this.primeMoverMuscle,
    this.secondaryMuscle,
    this.tertiaryMuscle,
    this.primaryEquipment,
    this.primaryItems,
    this.secondaryEquipment,
    this.secondaryItems,
    this.posture,
    this.singleOrDoubleArm,
    this.continuousOrAlternatingArms,
    this.grip,
    this.loadPositionEnding,
    this.continuousOrAlternatingLegs,
    this.footElevation,
    this.combinationExercises,
    this.movementPattern1,
    this.movementPattern2,
    this.movementPattern3,
    this.planeOfMotion1,
    this.planeOfMotion2,
    this.planeOfMotion3,
    this.bodyRegion,
    this.forceType,
    this.mechanics,
    this.laterality,
    this.primaryExerciseClassification,
    this.shortYoutubeDemonstrationLink,
    this.inDepthYoutubeExplanationLink,});

  String? id;
  String? exercise;
  String? shortYoutubeDemonstration;
  String? inDepthYoutubeExplanation;
  String? difficultyLevel;
  String? targetMuscleGroup;
  String? primeMoverMuscle;
  dynamic secondaryMuscle;
  dynamic tertiaryMuscle;
  String? primaryEquipment;
  num? primaryItems;
  dynamic secondaryEquipment;
  num? secondaryItems;
  String? posture;
  String? singleOrDoubleArm;
  String? continuousOrAlternatingArms;
  String? grip;
  String? loadPositionEnding;
  String? continuousOrAlternatingLegs;
  String? footElevation;
  String? combinationExercises;
  String? movementPattern1;
  dynamic movementPattern2;
  dynamic movementPattern3;
  String? planeOfMotion1;
  dynamic planeOfMotion2;
  dynamic planeOfMotion3;
  String? bodyRegion;
  String? forceType;
  String? mechanics;
  String? laterality;
  String? primaryExerciseClassification;
  String? shortYoutubeDemonstrationLink;
  String? inDepthYoutubeExplanationLink;
}