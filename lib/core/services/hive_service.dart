


import 'package:fitness_app/features/chatbot/data/model/local_db/chat_history_model.dart';
import 'package:fitness_app/features/chatbot/data/model/local_db/message_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveService {

  static const chatBoxName   = 'chats';

  Future<void> initializeHive ()async{

    await  Hive.initFlutter();

    Hive.registerAdapter(MessageModelAdapter());
    Hive.registerAdapter(ChatHistoryModelAdapter());

    await Hive.openBox<ChatHistoryModel>(chatBoxName);

  }

  Future<void> closeHive ()async{

    await Hive.close();
  }

}