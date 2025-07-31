// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levels_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelsResponseDTO _$LevelsResponseDTOFromJson(Map<String, dynamic> json) =>
    LevelsResponseDTO(
      message: json['message'] as String,
      levels: (json['levels'] as List<dynamic>)
          .map((e) => DifficultyLevelDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LevelsResponseDTOToJson(LevelsResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'levels': instance.levels,
    };
