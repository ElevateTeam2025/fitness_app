import 'package:fitness_app/core/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:fitness_app/generated/l10n.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/language/language_selector_tile.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/logout/logout_widget.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/custom_tile_widget.dart';

class MockLocaleProvider extends Mock implements LocaleProvider {}

void main() {
  late MockLocaleProvider mockLocaleProvider;

  setUpAll(() {
    registerFallbackValue(const Locale('en'));
  });

  setUp(() {
    mockLocaleProvider = MockLocaleProvider();

    when(() => mockLocaleProvider.locale).thenReturn(const Locale('en'));
    when(() => mockLocaleProvider.changeLocale(any())).thenReturn(null);

    ScreenSizeService.width = 375;
    ScreenSizeService.height = 812;
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<LocaleProvider>.value(
      value: mockLocaleProvider,
      child: MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        // home: const Scaffold(
        //   body: SingleChildScrollView(
        //     child: ProfileOptionsSection(u ,),
        //   ),
        // ),
      ),
    );
  }

  testWidgets('renders all profile option tiles and reacts to tap', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text(S.current.editProfile), findsOneWidget);
    expect(find.text(S.current.changePassword), findsOneWidget);
    expect(find.text(S.current.security), findsOneWidget);
    expect(find.text(S.current.privacyPolicy), findsOneWidget);
    expect(find.text(S.current.help), findsOneWidget);
    expect(find.text(S.current.logout), findsOneWidget);

    expect(find.byType(CustomTileWidget), findsNWidgets(5));
    expect(find.byType(LanguageSelectorTile), findsOneWidget);
    expect(find.byType(CustomLogoutWidget), findsOneWidget);
  });
}
