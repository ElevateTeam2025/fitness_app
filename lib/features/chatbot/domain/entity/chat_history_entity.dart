import 'package:uuid/uuid.dart';

import '../../data/model/local_db/chat_history_model.dart';
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

  factory ChatHistoryEntity.fromModel(ChatHistoryModel model) {
    return ChatHistoryEntity(
      id: model.id,
      title: model.title,
      messages: model.messages
          .map((messageModel) => MessageEntity(
        id: messageModel.id,
        content: messageModel.content,
        role: messageModel.role,
        timestamp: messageModel.timestamp,
      ))
          .toList(),
      createdAt: model.createdAt,
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