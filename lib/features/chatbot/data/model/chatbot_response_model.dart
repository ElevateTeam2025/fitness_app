import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ChatbotResponseModel {
  String? message;

  bool isUser ;
  ChatbotResponseModel({this.message,this.isUser=false});
}