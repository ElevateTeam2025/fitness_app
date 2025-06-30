class MessageEntity {
  final String id;
  final String content;
  final String role;
  final DateTime timestamp;

  const MessageEntity({
    required this.id,
    required this.content,
    required this.role,
    required this.timestamp,
  });

  MessageEntity copyWith({
    String? id,
    String? content,
    String? role,
    DateTime? timestamp,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      role: role ?? this.role,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}