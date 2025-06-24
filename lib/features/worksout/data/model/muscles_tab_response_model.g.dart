// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_tab_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesTabResponseModel _$MusclesTabResponseModelFromJson(
  Map<String, dynamic> json,
) => MusclesTabResponseModel(
  message: json['message'] as String?,
  musclesGroup: (json['musclesGroup'] as List<dynamic>?)
      ?.map((e) => MusclesComponentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MusclesTabResponseModelToJson(
  MusclesTabResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'musclesGroup': instance.musclesGroup,
};

MusclesComponentModel _$MusclesComponentModelFromJson(
  Map<String, dynamic> json,
) => MusclesComponentModel(
  id: json['_id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$MusclesComponentModelToJson(
  MusclesComponentModel instance,
) => <String, dynamic>{'name': instance.name, '_id': instance.id};
