import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../model/local_db/chat_history_model.dart';

abstract interface class LocalDataDataSource {
  Future<List<ChatHistoryModel>> getAllChats();

  Future<ChatHistoryModel?> getChatById(String id);

  Future<void> saveChatHistory(ChatHistoryModel chat);

  Future<void> updateChatHistory(ChatHistoryModel chat);

  Future<void> clearAllChatHistory();
}

@Injectable(as: LocalDataDataSource)
class LocalDataSourceImpl implements LocalDataDataSource {
  static const String chatBoxName = 'chats';

  @override
  Future<List<ChatHistoryModel>> getAllChats() async {
    try {
      final box = await Hive.openBox<ChatHistoryModel>(chatBoxName);
      return box.values.toList();
    } catch (e) {
      throw Exception('Failed to load chats from local storage: $e');
    }
  }

  @override
  Future<ChatHistoryModel?> getChatById(String id) async {
    try {
      final box = await Hive.openBox<ChatHistoryModel>(chatBoxName);
      final chat = box.get(id);

      return chat;
    } catch (e) {
      print('LocalDataSource error: $e');
      throw Exception('Failed to get chat by id: $e');
    }
  }

  @override
  Future<void> saveChatHistory(ChatHistoryModel chat) async {
    try {
      final box = await Hive.openBox<ChatHistoryModel>(chatBoxName);
      await box.put(chat.id, chat);
    } catch (e) {
      throw Exception('Failed to save chat: $e');
    }
  }

  @override
  Future<void> updateChatHistory(ChatHistoryModel chat) async {
    try {
      final box = await Hive.openBox<ChatHistoryModel>(chatBoxName);
      await box.put(chat.id, chat);
    } catch (e) {
      throw Exception('Failed to update chat: $e');
    }
  }

  @override
  Future<void> clearAllChatHistory() async{
    final box = await Hive.openBox<ChatHistoryModel>(chatBoxName);
    await box.clear();
  }
}
