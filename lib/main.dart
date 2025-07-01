import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/router/routes_generator.dart';
import 'package:fitness_app/core/services/bloc_observer.dart';
import 'package:fitness_app/core/services/easy_loading_service.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/core/services/shared_preference_services.dart';
import 'package:fitness_app/core/utils/theming.dart';
import 'package:fitness_app/features/edit_profile/presentation/cubits/edit_profile_cubit/edit_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/services/localization_service.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();

  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ConfigLoading().showLoading();
  await SharedPreferenceServices.init();

  runApp(InitApp());
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          ScreenSizeService.init(context);

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ],
            child: MainAppContent(),
          );
        },
      ),
      builder: EasyLoading.init(),
    );
  }
}

class MainAppContent extends StatelessWidget {
  const MainAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();

    return BlocProvider(
      create: (context) => getIt<EditProfileViewModel>(),
      child: MaterialApp(
        locale: localeProvider.locale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: PagesRoutes.signIn,
     // initialRoute: PagesRoutes.mealsCategories,
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: RoutesGenerator.onGenerateRoute,
        initialRoute: PagesRoutes.splashScreen,
        // initialRoute: PagesRoutes.mealsCategories,
      ),
    );
  }
}
