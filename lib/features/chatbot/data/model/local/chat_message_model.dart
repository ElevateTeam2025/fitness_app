import 'package:hive/hive.dart';


part 'chat_message_model.g.dart';
@HiveType(typeId: 0)
class ChatMessageModel extends HiveObject {
  @HiveField(0)
  final String message;

  @HiveField(1)
  final bool isUser;

  ChatMessageModel({
    required this.message,

    required this.isUser,
  });

  @override
  String toString() {
    return 'ChatMessageModel(message: $message,  isUserMessage: $isUser)';
  }
}