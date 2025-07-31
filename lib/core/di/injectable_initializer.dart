import 'package:fitness_app/core/di/injectable_initializer.config.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';
import 'package:fitness_app/features/chatbot/data/model/chat_history_model.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/env_config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  Gemini.init(apiKey: EnvConfig.apiKey);
  getIt.registerSingleton<Gemini>(Gemini.instance);
  final chatHistoryBox = await Hive.openBox<ChatHistoryModel>(
    AppConstants.boxName,
  );
  getIt.registerSingleton<Box<ChatHistoryModel>>(chatHistoryBox);
  getIt.init();
}
