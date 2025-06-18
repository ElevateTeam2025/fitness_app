import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/build_page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('BuildPageTitle displays title and subtitle with correct styles', (tester) async {
    const testTitle = 'Main Title';
    const testSubTitle = 'Sub Title';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: BuildPageTitle(title: testTitle, subTitle: testSubTitle),
        ),
      ),
    );

    // تحقق من ظهور العنوان الرئيسي
    final titleFinder = find.text(testTitle);
    expect(titleFinder, findsOneWidget);

    // تحقق من ظهور العنوان الفرعي
    final subTitleFinder = find.text(testSubTitle);
    expect(subTitleFinder, findsOneWidget);

    // تحقق أن نص العنوان الرئيسي لونه أبيض
    final Text titleTextWidget = tester.widget(titleFinder);
    expect(titleTextWidget.style?.color, Colors.white);

    // تحقق أن نص العنوان الفرعي لونه أبيض
    final Text subTitleTextWidget = tester.widget(subTitleFinder);
    expect(subTitleTextWidget.style?.color, Colors.white);

    // تحقق من وجود Padding حسب Left Responsive (هذا يمكن أن يكون صعب الاختبار بدقة، لكن يمكنك التأكد من وجود Padding)
    final paddingFinder = find.byType(Padding);
    expect(paddingFinder, findsOneWidget);
  });
}
