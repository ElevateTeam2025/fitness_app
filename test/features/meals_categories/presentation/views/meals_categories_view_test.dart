import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_in/domain/entity/sign_in_request.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/cubit/sign_in_cubit/sign_in_view_model.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class MockSignInViewModel extends MockCubit<SignInState> implements SignInViewModel {}

void main() {
  late MockSignInViewModel mockViewModel;

  setUpAll(() {
    registerFallbackValue(SignInClickedIntent(SignInRequest(email: '', password: '')));
  });

  setUp(() {
    mockViewModel = MockSignInViewModel();

    when(() => mockViewModel.stream).thenAnswer((_) => Stream<SignInState>.empty());
    when(() => mockViewModel.state).thenReturn(InitialSignInState());
    when(() => mockViewModel.doIntent(any())).thenReturn(null);

    ScreenSizeService.height = 812.0;
    ScreenSizeService.width = 375.0;
  });


  Widget createTestWidget(Widget child) {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: Size(375, 812)),
        child: FlutterEasyLoading(
          child: BlocProvider<SignInViewModel>.value(
            value: mockViewModel,
            child: Scaffold(body: child),
          ),
        ),
      ),
    );
  }

  testWidgets('SignInViewBody renders and submits valid input', (tester) async {
    when(() => mockViewModel.state).thenReturn(InitialSignInState());
    when(() => mockViewModel.doIntent(any())).thenReturn(null);

    await tester.pumpWidget(createTestWidget(SignInViewBody(signInViewModel: mockViewModel)));
    await tester.pumpAndSettle();

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final signInButton = find.byKey(const Key('signInButton'));

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'Abc@12345');
    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    final captured = verify(() => mockViewModel.doIntent(captureAny())).captured;
    expect(captured.length, 1);

    final intent = captured.first as SignInClickedIntent;
    expect(intent.data.email, 'test@example.com');
    expect(intent.data.password, 'Abc@12345');
  });
}
