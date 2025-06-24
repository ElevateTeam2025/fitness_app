import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/difficulty_level_entity.dart';

part 'difficult_level_dto.g.dart';

@JsonSerializable()
class DifficultyLevelDTO {
  @JsonKey(name: '_id')
  final String id;

  final String name;

  DifficultyLevelDTO({required this.id, required this.name});

  factory DifficultyLevelDTO.fromJson(Map<String, dynamic> json) =>
      _$DifficultyLevelDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DifficultyLevelDTOToJson(this);

  DifficultyLevelEntity toEntity() {
    return DifficultyLevelEntity(id: id, name: name);
  }
}
