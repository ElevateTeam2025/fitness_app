import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/gender/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fitness_app/core/utils/app_colors.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('GenderWidget shows icon and name and changes color when selected', (tester) async {
    bool isTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GenderWidget(
            isSelected: false,
            onPress: () {
              isTapped = true;
            },
            icon: 'assets/icons/male.png',
            name: 'Male',
          ),
        ),
      ),
    );

    // تحقق أن النص موجود
    expect(find.text('Male'), findsOneWidget);

    // تحقق أن الصورة موجودة
    expect(find.byType(Image), findsOneWidget);

    // تحقق أن الخلفية ليست لون primary (لأن isSelected false)
    Container container = tester.widget(find.byType(Container));
    BoxDecoration decoration = container.decoration as BoxDecoration;
    expect(decoration.color, Colors.transparent);

    // اضغط على ال widget
    await tester.tap(find.byType(GenderWidget));
    expect(isTapped, true);
  });

  testWidgets('GenderWidget has primary color when selected', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GenderWidget(
            isSelected: true,
            onPress: () {},
            icon: 'assets/icons/female.png', // ضع مسار أي أيقونة مناسبة
            name: 'Female',
          ),
        ),
      ),
    );

    // تحقق أن الخلفية لونها primaryColor عند isSelected = true
    Container container = tester.widget(find.byType(Container));
    BoxDecoration decoration = container.decoration as BoxDecoration;
    expect(decoration.color, AppColors.primaryColor);
  });
}
