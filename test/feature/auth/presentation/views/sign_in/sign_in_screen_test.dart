import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_it/get_it.dart';

import 'package:fitness_app/feature/auth/presentation/views/sign_in/sign_in_screen.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart';



final getIt = GetIt.instance;
class MockSignInViewModel extends Mock implements SignInViewModel {}


void main() {
  late MockSignInViewModel mockViewModel;

  setUpAll(() {
    mockViewModel = MockSignInViewModel();

    // clean GetIt before register
    if (getIt.isRegistered<SignInViewModel>()) {
      getIt.unregister<SignInViewModel>();
    }

    getIt.registerSingleton<SignInViewModel>(mockViewModel);
    ScreenSizeService.height = 812.0;
    ScreenSizeService.width = 375.0;
    when(() => mockViewModel.state).thenReturn(InitialSignInState());
    when(() => mockViewModel.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('SignInScreen renders with background and SignInViewBody',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: SignInScreen(),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.byType(SignInScreen), findsOneWidget);
        expect(find.byKey(const Key('emailField')), findsOneWidget);
      });
}

