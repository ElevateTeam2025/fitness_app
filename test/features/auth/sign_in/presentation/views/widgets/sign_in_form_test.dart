import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/views/widgets/sign_in_form.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock NavigatorObserver for navigation verification
class _MockNavigatorObserver extends Mock implements NavigatorObserver {}

// Fake Route for mocktail fallback
class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  setUpAll(() {
    // Register fallback value for Route<dynamic>
    registerFallbackValue(FakeRoute());
  });

  setUp(() {
    // Setup screen size service mock
    ScreenSizeService.width = 400;
    ScreenSizeService.height = 800;
  });

  testWidgets('SignInForm renders correctly and reacts to input', (tester) async {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    bool passwordVisible = false;
    bool submitCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SignInForm(
            emailController: emailController,
            passwordController: passwordController,
            isPasswordVisible: passwordVisible,
            onPasswordVisibilityToggle: () {
              passwordVisible = !passwordVisible;
            },
            onSubmit: () {
              submitCalled = true;
            },
            emailFocusNode: emailFocusNode,
            passwordFocusNode: passwordFocusNode,
            isFormValid: true,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'Abc@123');

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(submitCalled, true);
  });

  testWidgets('Password visibility toggle changes icon and state', (tester) async {
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    bool passwordVisible = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => SignInForm(
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
              isPasswordVisible: passwordVisible,
              onPasswordVisibilityToggle: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              onSubmit: () {},
              emailFocusNode: emailFocusNode,
              passwordFocusNode: passwordFocusNode,
              isFormValid: true,
            ),
          ),
        ),
      ),
    );

    // Initially should show visibility_off icon
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pumpAndSettle();

    // After toggle, should show visibility icon
    expect(find.byIcon(Icons.visibility), findsOneWidget);
  });

  testWidgets('Shows validation errors on invalid input when autovalidateMode is onUserInteraction', (tester) async {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SignInForm(
            emailController: emailController,
            passwordController: passwordController,
            isPasswordVisible: false,
            onPasswordVisibilityToggle: () {},
            onSubmit: () {},
            emailFocusNode: emailFocusNode,
            passwordFocusNode: passwordFocusNode,
            isFormValid: false,
          ),
        ),
      ),
    );

    // Enter invalid inputs
    await tester.enterText(find.byKey(const Key('emailField')), 'invalid-email');
    await tester.enterText(find.byKey(const Key('passwordField')), '123');

    await tester.pumpAndSettle();

    // Adjust these strings to match your validator error messages exactly
    expect(find.text('Please enter a valid email'), findsOneWidget);
    expect(find.text('Password should be at least 8 characters long'), findsOneWidget);
  });

  testWidgets('Forget password button navigates to forget password route', (tester) async {
    final mockObserver = _MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [mockObserver],
        routes: {
          PagesRoutes.forgetPasswordView: (context) => const Scaffold(
            body: Center(child: Text('Forget Password Page')),
          ),
        },
        home: Scaffold(
          body: SignInForm(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            isPasswordVisible: false,
            onPasswordVisibilityToggle: () {},
            onSubmit: () {},
            emailFocusNode: FocusNode(),
            passwordFocusNode: FocusNode(),
            isFormValid: true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('forgetPassword'));
    await tester.pumpAndSettle();

    verify(() => mockObserver.didPush(any(), any())).called(greaterThanOrEqualTo(1));
    expect(find.text('Forget Password Page'), findsOneWidget);
  });
}
