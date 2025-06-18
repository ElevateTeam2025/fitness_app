import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/custom_list_tile.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('CustomListTile displays title and reacts to tap, shows selected state', (tester) async {
    bool tapped = false;

    // بناء الـ widget داخل اختبار
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomListTile(
            title: 'Test Title',
            isSelected: true,
            onPress: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    // ابحث عن Text بالعنوان
    expect(find.text('Test Title'), findsOneWidget);

    // ابحث عن InkWell (الذي يلتقط النقر)
    final inkWellFinder = find.byType(InkWell);
    expect(inkWellFinder, findsOneWidget);

    // ابحث عن كل Containers التي تحتوي على border لونه primaryColor
    final containersWithBorder = find.descendant(
      of: inkWellFinder,
      matching: find.byWidgetPredicate((widget) {
        if (widget is Container) {
          final decoration = widget.decoration;
          if (decoration is BoxDecoration) {
            final border = decoration.border;
            if (border != null && border.top.color == AppColors.primaryColor) {
              return true;
            }
          }
        }
        return false;
      }),
    );

    // يجب أن نجد عنصرين (الحاوي الخارجي والدائرة الصغيرة)
    expect(containersWithBorder, findsNWidgets(2));

    // نفترض أن الحاوي الأكبر هو الأول (أو الأخير حسب بناء الودجت)
    final containerWithBorder = containersWithBorder.first;
    expect(containerWithBorder, findsOneWidget);

    // اضغط على الـ InkWell
    await tester.tap(inkWellFinder);
    await tester.pumpAndSettle();

    // تحقق من أن الـ onPress تم استدعاؤه (تم تغيير bool tapped)
    expect(tapped, isTrue);
  });
}

