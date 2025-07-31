import 'package:fitness_app/core/api/api_execute.dart';
import 'package:fitness_app/core/common/result.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../model/chat_history_model.dart';

abstract class ChatbotLocalDataSource {
  Future<List<ChatHistoryModel>> getAllChats();

  Future<ChatHistoryModel?> getChatById(String id);

  Future<void> saveChat(ChatHistoryModel chat); // add or update

  Future<void> deleteChat(String id);

  Future<void> clearAllChats();

  Future<Result<ChatHistoryModel>> createChat();
}

@Injectable(as: ChatbotLocalDataSource)
class ChatbotLocalDataSourceImpl implements ChatbotLocalDataSource {
  final Box<ChatHistoryModel> _chatHistoryBox;

  ChatbotLocalDataSourceImpl(this._chatHistoryBox);

  @override
  Future<void> clearAllChats() async {
    await _chatHistoryBox.clear();
  }

  @override
  Future<void> deleteChat(String id) async {
    await _chatHistoryBox.delete(id);
  }

  @override
  Future<List<ChatHistoryModel>> getAllChats() async {
    return _chatHistoryBox.values.toList();
  }

  @override
  Future<ChatHistoryModel?> getChatById(String id) async {
    return _chatHistoryBox.get(id);
  }

  @override
  Future<void> saveChat(ChatHistoryModel chat) async {
    await _chatHistoryBox.put(chat.id, chat);
  }

  @override
  Future<Result<ChatHistoryModel>> createChat() async {
    return executeApi(() async {
      final chat = ChatHistoryModel.create();
      await _chatHistoryBox.put(chat.id, chat); // Save to Hive
      return chat;
    });
  }
}
