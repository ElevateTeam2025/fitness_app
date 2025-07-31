import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'message_model.dart';

part 'chat_history_model.g.dart';

@HiveType(typeId: 1)
class ChatHistoryModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  final List<MessageModel> messages;

  @HiveField(3)
  final DateTime createdAt;
  ChatHistoryModel({
    required this.id,
    required this.title,
    required this.messages,
    required this.createdAt,
  });
  factory ChatHistoryModel.create() {
    return ChatHistoryModel(
      id: const Uuid().v4(),
      title: 'New Chat',
      messages: [],
      createdAt: DateTime.now(),
    );
  }
}
