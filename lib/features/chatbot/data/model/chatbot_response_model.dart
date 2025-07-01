import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ChatbotResponseModel {
  String? message;
  ChatbotResponseModel({this.message});
}