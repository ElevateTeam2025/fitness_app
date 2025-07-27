import 'package:fitness_app/core/di/injectable_initializer.config.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';
import 'package:fitness_app/core/utils/end_points.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/chatbot/data/model/chat_history_model.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  Gemini.init(apiKey: ApiEndPoints.apiKey);
  getIt.registerSingleton<Gemini>(Gemini.instance);
  final chatHistoryBox = await Hive.openBox<ChatHistoryModel>(AppConstants.boxName);
  getIt.registerSingleton<Box<ChatHistoryModel>>(chatHistoryBox);
 getIt.init();
}
