import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ChatbotResponseModel {
  String? message;
  bool isUser;
  bool isSkeleton;
  ChatbotResponseModel({
    this.message,
    this.isUser = false,
    this.isSkeleton = false,
  });
}
