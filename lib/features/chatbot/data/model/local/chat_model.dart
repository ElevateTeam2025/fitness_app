

import 'package:fitness_app/features/chatbot/data/model/local/chat_message_model.dart';
import 'package:hive/hive.dart';
part 'chat_model.g.dart';

@HiveType(typeId: 1)
class ChatModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<ChatMessageModel> messages;

  ChatModel({
    required this.id,
    required this.title,
    required this.messages,
  });

  @override
  String toString() {
    return 'ChatModel(id: $id, title: $title, messages: $messages)';
  }
}