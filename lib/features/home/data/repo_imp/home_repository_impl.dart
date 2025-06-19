import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/common/result.dart';
import '../../../../core/api/api_execute.dart';
import '../../domain/entity/exercise_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/home_data_source.dart';

@Injectable(as: HomeRepo)
class HomeRepositoryImpl implements HomeRepo {
  final HomeDataSource dataSource;
  // final InternetConnectionChecker internetConnectionChecker;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<ExerciseEntity>>>getAllWorkouts () async {
    return await executeApi(() async {
      final exerciseResponseDTO = await dataSource.getAllWorkouts();
      final categories =
      exerciseResponseDTO.exercises.map((dto) {
            return ExerciseEntity(
              id: dto.id,
              exercise: dto.exercise,
              shortYoutubeDemonstration: dto.shortYoutubeDemonstration,
              difficultyLevel: dto.difficultyLevel,
              inDepthYoutubeExplanation: dto.inDepthYoutubeExplanation??"",
              targetMuscleGroup:dto.targetMuscleGroup ,
              primeMoverMuscle: dto.primeMoverMuscle,
              primaryEquipment: dto.primaryEquipment,
              primaryItems: dto.primaryItems,
              secondaryItems: dto.secondaryItems,
              posture: dto.posture,
              singleOrDoubleArm: dto.singleOrDoubleArm,
              continuousOrAlternatingArms: dto.continuousOrAlternatingArms,
              grip: dto.grip,
              loadPositionEnding: dto.loadPositionEnding,
              continuousOrAlternatingLegs: dto.continuousOrAlternatingLegs,
              footElevation: dto.footElevation,
              combinationExercises: dto.combinationExercises,
              movementPattern1: dto.movementPattern1,
              planeOfMotion1: dto.planeOfMotion1,
              bodyRegion: dto.bodyRegion,
              forceType: dto.forceType,
              mechanics: dto.mechanics,
              laterality: dto.laterality,
              primaryExerciseClassification: dto.primaryExerciseClassification,
              shortYoutubeDemonstrationLink: dto.shortYoutubeDemonstrationLink,
              inDepthYoutubeExplanationLink: dto.inDepthYoutubeExplanationLink??"",


            );
          }).toList();
      return categories;
    });
  }


  @override
  Future<Result<List<ExerciseEntity>>> getRecommendation() async {
    return await executeApi(() async {
      final exerciseResponseDTO = await dataSource.getAllWorkouts();
      final exercise =
      exerciseResponseDTO.exercises.map((dto) {
            return ExerciseEntity(
              id: dto.id,
              exercise: dto.exercise,
               shortYoutubeDemonstration: dto.shortYoutubeDemonstration,
              difficultyLevel: dto.difficultyLevel,
              inDepthYoutubeExplanation: dto.inDepthYoutubeExplanation??"",
              targetMuscleGroup:dto.targetMuscleGroup ,
              primeMoverMuscle: dto.primeMoverMuscle,
              primaryEquipment: dto.primaryEquipment,
              primaryItems: dto.primaryItems,
              secondaryItems: dto.secondaryItems,
              posture: dto.posture,
              singleOrDoubleArm: dto.singleOrDoubleArm,
              continuousOrAlternatingArms: dto.continuousOrAlternatingArms,
              grip: dto.grip,
              loadPositionEnding: dto.loadPositionEnding,
              continuousOrAlternatingLegs: dto.continuousOrAlternatingLegs,
              footElevation: dto.footElevation,
              combinationExercises: dto.combinationExercises,
              movementPattern1: dto.movementPattern1,
              planeOfMotion1: dto.planeOfMotion1,
              bodyRegion: dto.bodyRegion,
              forceType: dto.forceType,
              mechanics: dto.mechanics,
              laterality: dto.laterality,
              primaryExerciseClassification: dto.primaryExerciseClassification,
              shortYoutubeDemonstrationLink: dto.shortYoutubeDemonstrationLink,
              inDepthYoutubeExplanationLink: dto.inDepthYoutubeExplanationLink??"",


            );
          }).toList();
      return exercise;
    });
  }



  // try {
  //   bool isConnected = await InternetConnectionChecker.instance.hasConnection;
  //   if (isConnected) {
  //     final occasionResponseDTO = await dataSource.getOccasion();
  //     log("i am in the rpo imp");
  //     if (occasionResponseDTO.message == "success") {
  //       log("i am in the rpo imp");
  //       final occasion =
  //           occasionResponseDTO.occasions.map((dto) {
  //             return MasterEntity(
  //               id: dto.id,
  //               name: dto.name,
  //               slug: dto.slug,
  //               image: dto.image,
  //               createdAt: dto.createdAt,
  //               updatedAt: dto.updatedAt,
  //               productsCount: dto.productsCount,
  //             );
  //           }).toList();
  //
  //       return Success(occasion);
  //     } else {
  //       return Error(occasionResponseDTO.error ?? "");
  //     }
  //   } else {
  //     return Error(
  //       "Please check your internet connection and try again later",
  //     );
  //   }
  // } on DioException catch (dioExep) {
  //   return Error(
  //     ServerFailure.fromDioException(dioExep).errorMessage.toString(),
  //   );
  // } catch (e) {
  //   return Error(
  //     ServerFailure(errorMessage: e.toString()).errorMessage.toString(),
  //   );
  // }
}
