import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/profile/domain/entity/section_json_model.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/json_view/section_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// dummy Section object for testing
final testSection = Section(
  section: '1',
  title: {'en': 'Test Title', 'ar': 'عنوان الاختبار'},
  content: {
    'en': [
      'Paragraph 1',
      {
        'label': 'Facebook',
        'icon': 'facebook',
        'link': 'https://facebook.com',
      },
      'Paragraph 2',
    ],
    'ar': [
      'فقرة 1',
      {
        'label': 'فيسبوك',
        'icon': 'facebook',
        'link': 'https://facebook.com',
      },
      'فقرة 2',
    ],
  },
  style: {
    'fontSize': 18,
    'fontWeight': 'bold',
    'color': '#FF0000',
    'title': {
      'fontSize': 24,
      'fontWeight': 'bold',
      'color': '#00FF00',
    },
    'content': {
      'fontSize': 16,
      'fontWeight': 'normal',
      'color': '#0000FF',
    }
  },
);

void main() {
  Animate.restartOnHotReload = false;

  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });

  testWidgets('SectionContentWidget displays title and content correctly', (tester) async {
    final pageController = PageController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PageView(
            controller: pageController,
            children: [
              SectionContentWidget(
                section: testSection,
                index: 0,
                totalSections: 2,
                pageController: pageController,
                locale: 'en',
              ),
              Container(),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);

    expect(find.text('Paragraph 1'), findsOneWidget);

    expect(find.byIcon(FontAwesomeIcons.facebook), findsOneWidget);

    expect(find.text('Paragraph 2'), findsOneWidget);

    expect(find.text('previous'), findsNothing);
    expect(find.text('next'), findsOneWidget);

    await tester.tap(find.text('next'));
    await tester.pumpAndSettle();
  });
}
