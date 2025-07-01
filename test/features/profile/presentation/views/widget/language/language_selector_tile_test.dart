import 'package:fitness_app/core/services/localization_service.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/language/language_selector_tile.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

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

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      home: ChangeNotifierProvider<LocaleProvider>.value(
        value: mockLocaleProvider,
        child: const Scaffold(
          body: LanguageSelectorTile(),
        ),
      ),
    );
  }

  testWidgets('Shows correct language and switches locale on toggle', (tester) async {
    when(() => mockLocaleProvider.locale).thenReturn(const Locale('en'));
    when(() => mockLocaleProvider.changeLocale(any())).thenReturn(null);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text('Select Language'), findsOneWidget);
    expect(find.text('(English)'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);

    await tester.tap(find.byType(Switch));
    verify(() => mockLocaleProvider.changeLocale(const Locale('ar'))).called(1);
  });
}
