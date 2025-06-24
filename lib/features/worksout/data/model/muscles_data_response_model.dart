import 'package:fitness_app/features/worksout/domain/entity/muscles_data_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscles_data_response_model.g.dart';

@JsonSerializable()
class MusclesDataResponseModel extends MusclesDataResponseEntity {
  MusclesDataResponseModel({super.message, this.muscles});

  @JsonKey(name: 'muscles')
  final List<MusclesDataListModel>? muscles;

  factory MusclesDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MusclesDataResponseModelFromJson(json);
}

@JsonSerializable()
class MusclesDataListModel extends MusclesDataListEntity {
  MusclesDataListModel({this.id, super.image, super.name});

  @JsonKey(name: '_id')
  final String? id;

  factory MusclesDataListModel.fromJson(Map<String, dynamic> json) =>
      _$MusclesDataListModelFromJson(json);
}
