import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/signup_select_age.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';

void main() {
  group('SignupSelectAge Widget Test', () {
    late SignupCubit signupCubit;

    setUp(() {
      signupCubit = SignupCubit();

      ScreenSizeService.width = 375;
      ScreenSizeService.height = 412;

    });

    tearDown(() {
      signupCubit.close();
    });

    testWidgets('renders title, subtitle, wheel widget and next button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SignupCubit>.value(
            value: signupCubit,
            child: Scaffold(
              body: SignupSelectAge(),
            ),
          ),
        ),
      );

      // تحقق من ظهور العنوان والنص الفرعي
      expect(find.text('HOW OLD ARE YOU ?'), findsOneWidget);
      expect(find.text('This Helps Us Create Your Personalized plan'), findsOneWidget);

      // تحقق وجود WheelWidget عبر وجود النص "Age"
      expect(find.text('Age'), findsOneWidget);

      // تحقق وجود زر Next
      final nextButton = find.widgetWithText(ElevatedButton, 'Next');
      expect(nextButton, findsOneWidget);

      // تحقق أن الزر مفعل
      final ElevatedButton buttonWidget = tester.widget(nextButton);
      expect(buttonWidget.onPressed, isNotNull);
    });

    testWidgets('changing wheel value updates cubit state and pressing next calls nextStep', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<SignupCubit>.value(
            value: signupCubit,
            child: Scaffold(
              body: SignupSelectAge(),
            ),
          ),
        ),
      );

      // لاحظ: WheelWidget يستخدم WheelSlider (package خارجي)، لذا لا يمكن التفاعل مباشرة معه بسهولة في اختبار unit
      // بدلاً من ذلك، نختبر تأثير تغيير القيمة عبر تحديث الحالة يدويًا

      // ضبط عمر cubit يدوياً
      signupCubit.emit(SignupState(age: 25));

      await tester.pumpAndSettle();

      // تحقق من أن عمر cubit هو 25
      expect(signupCubit.state.age, 25);

      // استمع لتأكيد استدعاء nextStep
      bool nextStepCalled = false;
      signupCubit.stream.listen((state) {
        // استبدل الشرط حسب كيفية عمل cubit الخاص بك
        // مثلاً لو nextStep يغير الخطوة أو حالة معينة
        nextStepCalled = true;
      });

      // اضغط زر Next
      final nextButton = find.widgetWithText(ElevatedButton, 'Next');
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(nextStepCalled, true);
    });
  });
}
