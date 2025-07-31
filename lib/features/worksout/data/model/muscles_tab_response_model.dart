import 'package:fitness_app/features/worksout/domain/entity/muscles_teb_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscles_tab_response_model.g.dart';

@JsonSerializable()
class MusclesTabResponseModel extends MusclesTebResponseEntity {
  MusclesTabResponseModel({super.message, this.musclesGroup});

  @JsonKey(name: "musclesGroup")
  final List<MusclesComponentModel>? musclesGroup;
  factory MusclesTabResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MusclesTabResponseModelFromJson(json);
}

@JsonSerializable()
class MusclesComponentModel extends MusclesComponentEntity {
  MusclesComponentModel({this.id, super.name});

  @JsonKey(name: "_id")
  final String? id;

  factory MusclesComponentModel.fromJson(Map<String, dynamic> json) =>
      _$MusclesComponentModelFromJson(json);
}
