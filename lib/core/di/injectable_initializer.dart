import 'package:fitness_app/core/di/injectable_initializer.config.dart';
import 'package:fitness_app/core/utils/end_points.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
 getIt.init();
}
