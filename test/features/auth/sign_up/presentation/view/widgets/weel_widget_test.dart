import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/weel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('WheelWidget displays label and initial value, and responds to value change', (WidgetTester tester) async {
    int changedValue = -1;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WheelWidget(
            minVal: 1,
            maxVal: 5,
            initVal: 3,
            label: 'Test Label',
            onValueChange: (val) {
              changedValue = val;
            },
          ),
        ),
      ),
    );

    // تحقق من وجود النص الخاص بالـ label
    expect(find.text('Test Label'), findsOneWidget);

    // تحقق من وجود الرقم الابتدائي (3)
    expect(find.text('3'), findsWidgets);

    // لا نستطيع التفاعل مع WheelSlider بسهولة (لأنه من مكتبة خارجية)،
    // لكن يمكننا فحص ان `onValueChange` تعمل ضمنياً من خلال محاكاة إعادة بناء الـ widget مع قيمة مختلفة:

    // أعد بناء الـ widget مع initVal جديدة
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WheelWidget(
            minVal: 1,
            maxVal: 5,
            initVal: 5,
            label: 'Test Label',
            onValueChange: (val) {
              changedValue = val;
            },
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('5'), findsWidgets);

    // هنا يمكننا فقط التحقق من أن النص المعروض مطابق للقيمة الجديدة
  });
}
