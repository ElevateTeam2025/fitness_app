


import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../features/chatbot/data/model/local/chat_message_model.dart';
import '../../features/chatbot/data/model/local/chat_model.dart';

@singleton
class HiveService {
  static const String chatBoxName = 'chats';

  Future<void> initializeHive() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(ChatMessageModelAdapter());
    Hive.registerAdapter(ChatModelAdapter());

    // Open boxes
    await Hive.openBox<ChatModel>(chatBoxName);
  }

  Future<void> closeHive() async {
    await Hive.close();
  }
}

