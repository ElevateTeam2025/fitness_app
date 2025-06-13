import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/router/routes_generator.dart';
import 'package:fitness_app/core/services/bloc_observer.dart';
import 'package:fitness_app/core/services/easy_loading_service.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/core/services/shared_preference_services.dart';
import 'package:fitness_app/core/utils/theming.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/verify_reset_code_view.dart';
import 'package:fitness_app/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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

          return MainAppContent();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      home:VerifyResetCodeView(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: theme(),
//       home: MaterialApp(
//         home: Scaffold(
//           body: Column(
//             children: [
//               ElevatedButton(onPressed: null, child: const Text('Button 1')),
//               ElevatedButton(onPressed: null, child: const Text('Button 2')),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Enter text',
//                   hintText: 'Hint text',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ],
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Search',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
