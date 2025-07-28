import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'message_model.g.dart';

@HiveType(typeId: 0)
class MessageModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final String role;

  @HiveField(3)
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.content,
    required this.role,
    required this.timestamp,
  });

  factory MessageModel.fromGeminiContent(Content content) {
    return MessageModel(
      id: const Uuid().v4(),
      content: content.parts?.first.toString() ?? '',
      role: content.role ?? 'model',
      timestamp: DateTime.now(),
    );
  }
}
