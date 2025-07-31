// import 'package:fitness_app/features/auth/forget_password/data/models/forget_password_request.dart';
// import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
// import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_states.dart';
// import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/forget_password_view_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'forget_password_view_body_test.mocks.dart';
//
//
// @GenerateNiceMocks([MockSpec<ForgetPasswordCubit>()])
// void main() {
//   late MockForgetPasswordCubit mockCubit;
//
//   setUpAll(() {
//     // NEW: Provide a dummy ForgetPasswordStates
//     provideDummy<ForgetPasswordStates>(ForgetPasswordInitial());
//   });
//
//   setUp(() {
//     mockCubit = MockForgetPasswordCubit();
//
//     when(mockCubit.formKey).thenReturn(GlobalKey<FormState>());
//     when(mockCubit.emailController).thenReturn(TextEditingController());
//     when(mockCubit.autovalidateMode).thenReturn(AutovalidateMode.disabled);
//     when(mockCubit.request).thenReturn(ForgotPasswordRequest(email: ''));
//
//     when(mockCubit.state).thenReturn(ForgetPasswordInitial());
//     when(mockCubit.stream).thenAnswer((_) => const Stream<ForgetPasswordStates>.empty());
//   });
//
//   testWidgets('renders ForgetPasswordViewBody UI', (WidgetTester tester) async {
//   await tester.pumpWidget(
//     MaterialApp(
//       home: MediaQuery(
//         data: MediaQueryData(size: const Size(390, 844)), // iPhone 13 size
//         child: BlocProvider<ForgetPasswordCubit>.value(
//           value: mockCubit,
//           child: const ForgetPasswordViewBody(),
//         ),
//       ),
//     ),
//   );
//
//   expect(find.byType(Form), findsOneWidget);
//   expect(find.byType(SingleChildScrollView), findsOneWidget);
//   expect(find.byType(Image), findsWidgets);
// });
// }
