import 'package:json_annotation/json_annotation.dart';
import 'difficult_level_dto.dart';

part 'levels_response_dto.g.dart';

@JsonSerializable()
class LevelsResponseDTO {
  final String message;
  final List<DifficultyLevelDTO> levels;

  LevelsResponseDTO({required this.message, required this.levels});

  factory LevelsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$LevelsResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LevelsResponseDTOToJson(this);
}
