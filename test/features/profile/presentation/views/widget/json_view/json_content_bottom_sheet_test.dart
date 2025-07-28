import 'package:fitness_app/features/profile/domain/entity/section_json_model.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/json_view/json_content_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<Section>> mockLoad(String assetPath, String rootKey) async {
  return [
    Section(
      section: '1',
      title: {'en': 'Title 1'},
      content: {'en': 'Content 1'},
      style: {'color': 'red'},
    ),
    Section(
      section: '2',
      title: {'en': 'Title 2'},
      content: {'en': 'Content 2'},
      style: {'color': 'blue'},
    ),
  ];
}

void main() {
  setUp(() {
    // Section.load = mockLoad;
  });

  testWidgets('JsonContentBottomSheet shows loading then sections', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  JsonContentBottomSheet.show(context, assetPath: 'fake_path.json', rootKey: 'root');
                },
                child: const Text('Show BottomSheet'),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show BottomSheet'));
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.text('Title 1'), findsOneWidget);
    expect(find.text('Title 2'), findsOneWidget);

    final pageViewFinder = find.byType(PageView);
    expect(pageViewFinder, findsOneWidget);

    await tester.drag(pageViewFinder, const Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.text('Title 2'), findsWidgets);
  });
}
