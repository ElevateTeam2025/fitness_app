import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:fitness_app/features/profile/presentation/views/widget/language/language_dialog.dart';
import 'package:fitness_app/core/services/localization_service.dart';
import 'package:fitness_app/generated/l10n.dart';

class MockLocaleProvider extends Mock implements LocaleProvider {}

void main() {
  late MockLocaleProvider mockLocaleProvider;

  setUpAll(() {
    registerFallbackValue(const Locale('en'));
  });

  setUp(() {
    mockLocaleProvider = MockLocaleProvider();
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;
  });

  Widget createTestWidget() {
    return MaterialApp(
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      home: ChangeNotifierProvider<LocaleProvider>.value(
        value: mockLocaleProvider,
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showLanguageDialog(context);
                  },
                  child: const Text('Show Dialog'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  testWidgets('Shows language dialog and allows language selection', (tester) async {
    when(() => mockLocaleProvider.locale).thenReturn(const Locale('en'));
    when(() => mockLocaleProvider.changeLocale(any())).thenReturn(null);

    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.language), findsOneWidget);

    expect(find.text('🇺🇸'), findsOneWidget);
    expect(find.text(S.current.english), findsOneWidget);
    expect(find.text('🇸🇦'), findsOneWidget);
    expect(find.text(S.current.arabic), findsOneWidget);

    await tester.tap(find.text(S.current.arabic));
    await tester.pumpAndSettle();

    verify(() => mockLocaleProvider.changeLocale(const Locale('ar'))).called(1);

    expect(find.text(S.current.language), findsNothing);
  });
}
