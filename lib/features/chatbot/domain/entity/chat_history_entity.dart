import 'package:uuid/uuid.dart';
import 'message_entity.dart';

class ChatHistoryEntity {
  final String id;
  String title;
  final List<MessageEntity> messages;
  final DateTime createdAt;

  ChatHistoryEntity({
    required this.id,
    required this.title,
    required this.messages,
    required this.createdAt,
  });

  factory ChatHistoryEntity.create() {
    return ChatHistoryEntity(
      id: const Uuid().v4(),
      title: 'New Chat',
      messages: [],
      createdAt: DateTime.now(),
    );
  }



  ChatHistoryEntity copyWith({
    String? id,
    String? title,
    List<MessageEntity>? messages,
    DateTime? createdAt,
  }) {
    return ChatHistoryEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      messages: messages ?? this.messages,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}