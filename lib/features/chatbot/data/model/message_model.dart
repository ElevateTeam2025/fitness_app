import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hive/hive.dart';

part 'message_model.g.dart';

@HiveType(typeId: 0)
class MessageModel extends HiveObject {


  @HiveField(0)
  final String content;

  @HiveField(1)
  final bool isUser;

  @HiveField(2)
  final DateTime timestamp;

  MessageModel({
    required this.content,
    required this.isUser,
    required this.timestamp,
  });

  factory MessageModel.fromGeminiContent(Content content) {
    return MessageModel(
      content: content.parts?.first.toString() ?? '',
      isUser: content.role.toString().toLowerCase() == 'user',
      timestamp: DateTime.now(),
    );
  }
}
