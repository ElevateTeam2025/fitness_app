import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/custom_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('CustomTileWidget renders correctly and reacts to tap', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTileWidget(
            icon: const Icon(Icons.home, key: Key('icon')),
            title: 'Home',
            trailing: const Icon(Icons.arrow_forward, key: Key('trailing')),
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    // Verify the title is shown
    expect(find.text('Home'), findsOneWidget);

    // Verify icon is present
    expect(find.byKey(const Key('icon')), findsOneWidget);

    // Verify trailing widget is present
    expect(find.byKey(const Key('trailing')), findsOneWidget);

    // Tap the widget
    await tester.tap(find.byType(CustomTileWidget));
    await tester.pumpAndSettle();

    // Verify onTap was called
    expect(tapped, isTrue);
  });
}
