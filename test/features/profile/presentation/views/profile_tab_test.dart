import 'package:fitness_app/core/services/localization_service.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/views/sign_in/sign_in_screen.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/user_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fitness_app/features/profile/presentation/views/profile_tab.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profile_view_model.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:provider/provider.dart';
//////////////////////////////


class PagesRoutes {
  static const String signIn = 'signIn';
  static const String home = '/';
}

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
          settings: settings,
        );

      case PagesRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileViewModel>(
            create: (context) => getIt<ProfileViewModel>(),
            child: const ProfileTab(),
          ),
          settings: settings,
        );


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("UnDefined Route: ${settings.name}")),
          ),
        );
    }
  }
}
/////////////////////////
class MockProfileViewModel extends Mock implements ProfileViewModel {}
final getIt = GetIt.instance;

void main() {
  late MockProfileViewModel mockProfileViewModel;

  setUp(() {
    mockProfileViewModel = MockProfileViewModel();
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;

    if (getIt.isRegistered<ProfileViewModel>()) {
      getIt.unregister<ProfileViewModel>();
    }
    getIt.registerFactory<ProfileViewModel>(() => mockProfileViewModel);

    when(() => mockProfileViewModel.state).thenReturn(LoadingProfileState());
    when(() => mockProfileViewModel.stream).thenAnswer((_) => const Stream.empty());

    when(() => mockProfileViewModel.state).thenReturn(LogoutSuccessState());
    when(() => mockProfileViewModel.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockProfileViewModel.close()).thenAnswer((_) async {});

    when(() => mockProfileViewModel.close()).thenAnswer((_) async {});
  });

  tearDown(() {
    if (getIt.isRegistered<ProfileViewModel>()) {
      getIt.unregister<ProfileViewModel>();
    }
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
    child: MaterialApp(
    localizationsDelegates: const [
    S.delegate,
    ],
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: '/',
    supportedLocales: S.delegate.supportedLocales,

      home: Scaffold(
        body: BlocProvider<ProfileViewModel>.value(
          value: mockProfileViewModel,
          child: const ProfileTab(),
        ),
      ),
    ));
  }

  testWidgets('Shows loading indicator when state is LoadingProfileState', (tester) async {
    when(() => mockProfileViewModel.state).thenReturn(LoadingProfileState());
    when(() => mockProfileViewModel.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Shows user info when state is SuccessProfileState with user data', (tester) async {
    final user = UserData(
      firstName: 'User1',
      lastName: 'User11',
      photo: null,
    );
    when(() => mockProfileViewModel.state).thenReturn(SuccessProfileState(user));
    when(() => mockProfileViewModel.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text('User1'), findsOneWidget);
    expect(find.text('User11'), findsOneWidget);
    expect(find.byType(UserInformationWidget), findsOneWidget);
  });

  testWidgets('Shows error message when state is ErrorProfileState', (tester) async {
    const errorMessage = 'Error loading profile';
    when(() => mockProfileViewModel.state).thenReturn(ErrorProfileState(errorMessage));
    when(() => mockProfileViewModel.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text(errorMessage), findsOneWidget);
  });


  testWidgets('Navigates to sign in page on LogoutSuccessState', (tester) async {
    await tester.pumpWidget(
      BlocProvider<ProfileViewModel>.value(
        value: mockProfileViewModel,
        child: createWidgetUnderTest(),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    expect(find.byType(SignInScreen), findsOneWidget);
  });

}

