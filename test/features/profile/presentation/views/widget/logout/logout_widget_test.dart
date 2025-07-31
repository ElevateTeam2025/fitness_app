import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/logout/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('CustomLogoutWidget renders correctly and reacts to tap', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomLogoutWidget(
            icon: const Icon(Icons.logout, key: Key('logout_icon')),
            title: 'Logout',
            trailing: const Icon(Icons.exit_to_app, key: Key('trailing_icon')),
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    // check title
    expect(find.text('Logout'), findsOneWidget);

    // icon
    expect(find.byKey(const Key('logout_icon')), findsOneWidget);

    // (trailing)
    expect(find.byKey(const Key('trailing_icon')), findsOneWidget);

    // click widget
    await tester.tap(find.byType(CustomLogoutWidget));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
