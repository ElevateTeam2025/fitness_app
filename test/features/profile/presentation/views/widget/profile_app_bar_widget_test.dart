import 'package:fitness_app/features/profile/presentation/views/widget/profile_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';

class TestNavigatorObserver extends NavigatorObserver {
  bool didPopCalled = false;

  @override
  void didPop(Route route, Route? previousRoute) {
    didPopCalled = true;
    super.didPop(route, previousRoute);
  }
}

void main() {
  late TestNavigatorObserver navigatorObserver;

  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;
    navigatorObserver = TestNavigatorObserver();
  });

  testWidgets('ProfileAppBarWidget displays profile text and back button works',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ProfileAppBarWidget();
                },
              ),
            ),
            navigatorObservers: [navigatorObserver],
          ),
        );

        await tester.pumpAndSettle();

        // Verify the profile text is displayed
        expect(find.text(S.current.profile), findsOneWidget);

        // Verify the back button exists
        final imageFinder = find.byType(Image);
        expect(imageFinder, findsOneWidget);

        // Tap the back button
        await tester.tap(imageFinder);
        await tester.pumpAndSettle();

        // Verify pop was called
        expect(navigatorObserver.didPopCalled, isTrue);
      });
}
