import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/gender/gender_widget.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/view/widgets/gender/signup_select_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/cubit/signup_view_model_state.dart';

import 'signup_select_gender_test.mocks.dart';

@GenerateMocks([SignupCubit])

void main() {
  late MockSignupCubit mockCubit;

  // تهيئة الـ mock قبل كل اختبار
  setUp(() {
    mockCubit = MockSignupCubit();

    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });

  // دالة لبناء الـ widget مع الـ BlocProvider
  Widget makeTestableWidget() {
    return MaterialApp(

      home: BlocProvider<SignupCubit>.value(
        value: mockCubit,

        child: const Scaffold(
          body: SignupSelectGender(),
        ),
      ),
    );
  }

  testWidgets('renders title, gender widgets and next button disabled initially', (tester) async {
    // حالة أولية بدون اختيار جنس
    when(mockCubit.state).thenReturn(SignupState(gender: ''));
    when(mockCubit.stream).thenAnswer((_) => Stream.value(mockCubit.state));

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    expect(find.text('TELL US ABOUT YOURSELF'), findsOneWidget);
    expect(find.text('male'), findsOneWidget);
    expect(find.text('female'), findsOneWidget);

    final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    // الزر يجب أن يكون معطل لأن لم يتم اختيار جنس
    expect(elevatedButton.enabled, isFalse);
  });

  testWidgets('select male gender and button enabled', (tester) async {
    // حالة الجنس مختار "male"
    when(mockCubit.state).thenReturn(SignupState(gender: 'male'));
    when(mockCubit.stream).thenAnswer((_) => Stream.value(mockCubit.state));

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    expect(find.widgetWithText(GenderWidget, 'male'), findsOneWidget);
    expect(find.widgetWithText(GenderWidget, 'female'), findsOneWidget);

    final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    // الزر يجب أن يكون مفعّل لأن تم اختيار جنس
    expect(elevatedButton.enabled, isTrue);
  });

  testWidgets('tap male GenderWidget calls selectGender with "male"', (tester) async {
    when(mockCubit.state).thenReturn(SignupState(gender: ''));
    when(mockCubit.stream).thenAnswer((_) => Stream.value(mockCubit.state));

    await tester.pumpWidget(makeTestableWidget());
    await tester.pumpAndSettle();

    final maleGenderWidget = find.widgetWithText(GenderWidget, 'male');
    expect(maleGenderWidget, findsOneWidget);

    // اضغط على male widget
    await tester.tap(maleGenderWidget);
    await tester.pump();

    // تحقق أن selectGender استدعيت مع "male"
    verify(mockCubit.selectGender('male')).called(1);
  });
  testWidgets('tap next button calls nextStep when gender selected', (tester) async {
    when(mockCubit.state).thenReturn(SignupState(gender: 'female'));
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget());

    final ElevatedButton button = tester.widget(find.byType(ElevatedButton));
    expect(button.enabled, isTrue);

    await tester.tap(find.byType(ElevatedButton));
    verify(mockCubit.nextStep()).called(1);
  });

}

// void main() {
//   late MockSignupCubit mockCubit;
//
//   setUp(() {
//     mockCubit = MockSignupCubit();
//
//     ScreenSizeService.width = 375;
//     ScreenSizeService.height = 412;
//
//   });
//
//   Widget makeTestableWidget() {
//     return MaterialApp(
//       home: BlocProvider<SignupCubit>.value(
//         value: mockCubit,
//         child: Scaffold(
//           body: SignupSelectGender(),
//         ),
//       ),
//     );
//   }
//
//   testWidgets('renders title, gender widgets and next button disabled initially', (tester) async {
//     // حالة البداية: gender غير محدد
//     when(mockCubit.state).thenReturn(SignupState(gender: ''));
//
//     await tester.pumpWidget(makeTestableWidget());
//
//     expect(find.text('TELL US ABOUT YOURSELF'), findsOneWidget);
//     expect(find.text('We need to know your gender'), findsOneWidget);
//
//     // يوجد عنصرين GenderWidget (ذكر وأنثى)
//     expect(find.byType(GenderWidget), findsNWidgets(2));
//
//     // زر "Next" معطل لأن لا جنس محدد
//     final ElevatedButton button = tester.widget(find.byType(ElevatedButton));
//     expect(button.enabled, isFalse);
//   });
//
//   testWidgets('select male gender and button enabled', (tester) async {
//     when(mockCubit.state).thenReturn(SignupState(gender: 'male'));
//
//     await tester.pumpWidget(makeTestableWidget());
//
//     final maleGenderWidget = find.widgetWithText(GenderWidget, 'male');
//     expect(maleGenderWidget, findsOneWidget);
//
//     final ElevatedButton button = tester.widget(find.byType(ElevatedButton));
//     expect(button.enabled, isTrue);
//   });
//
//   testWidgets('tap male GenderWidget calls selectGender with "male"', (tester) async {
//     when(mockCubit.state).thenReturn(SignupState(gender: ''));
//
//     await tester.pumpWidget(makeTestableWidget());
//
//     // لازم نستخدم when for stream لتجنب MissingStubError (من الخطأ اللي جربته سابقاً)
//     when(mockCubit.stream).thenAnswer((_) => const Stream.empty());
//
//     final maleGenderWidget = find.widgetWithText(GenderWidget, 'male');
//     expect(maleGenderWidget, findsOneWidget);
//
//     await tester.tap(maleGenderWidget);
//     verify(mockCubit.selectGender('male')).called(1);
//   });
//
//   testWidgets('tap next button calls nextStep when gender selected', (tester) async {
//     when(mockCubit.state).thenReturn(SignupState(gender: 'female'));
//     when(mockCubit.stream).thenAnswer((_) => const Stream.empty());
//
//     await tester.pumpWidget(makeTestableWidget());
//
//     final ElevatedButton button = tester.widget(find.byType(ElevatedButton));
//     expect(button.enabled, isTrue);
//
//     await tester.tap(find.byType(ElevatedButton));
//     verify(mockCubit.nextStep()).called(1);
//   });
// }
