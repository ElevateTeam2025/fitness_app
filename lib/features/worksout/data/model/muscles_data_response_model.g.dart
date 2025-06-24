// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesDataResponseModel _$MusclesDataResponseModelFromJson(
  Map<String, dynamic> json,
) => MusclesDataResponseModel(
  message: json['message'] as String?,
  muscles: (json['muscles'] as List<dynamic>?)
      ?.map((e) => MusclesDataListModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MusclesDataResponseModelToJson(
  MusclesDataResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'muscles': instance.muscles,
};

MusclesDataListModel _$MusclesDataListModelFromJson(
  Map<String, dynamic> json,
) => MusclesDataListModel(
  id: json['_id'] as String?,
  image: json['image'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$MusclesDataListModelToJson(
  MusclesDataListModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
  '_id': instance.id,
};
