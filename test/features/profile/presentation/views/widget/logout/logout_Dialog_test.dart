import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:fitness_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fitness_app/features/profile/presentation/cubit/profile_view_model.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/logout/logout_dialog.dart'; // عدل المسار حسب مشروعك
import 'package:fitness_app/generated/l10n.dart';

class MockProfileViewModel extends Mock implements ProfileViewModel {}
class FakeLogoutClickedIntent extends Fake implements LogoutClickedIntent {}

void main() {
  late MockProfileViewModel mockProfileViewModel;

  setUpAll(() {
    registerFallbackValue(FakeLogoutClickedIntent());
  });

  setUp(() {
    mockProfileViewModel = MockProfileViewModel();
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;

    when(() => mockProfileViewModel.stream)
        .thenAnswer((_) => Stream<ProfileState>.empty());

    when(() => mockProfileViewModel.state)
        .thenReturn(LoadingProfileState());

    when(() => mockProfileViewModel.doIntent(any())).thenReturn(null);
  });

  testWidgets('Logout dialog shows and calls LogoutClickedIntent on confirm', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: BlocProvider<ProfileViewModel>.value(
          value: mockProfileViewModel,
          child: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showLogoutDialog(context);
                    },
                    child: const Text('Show Dialog'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.logout), findsNWidgets(2));
    expect(find.text(S.current.confirmLogout), findsOneWidget);
    expect(find.text(S.current.cancel), findsOneWidget);

    await tester.tap(find.text(S.current.cancel));
    await tester.pumpAndSettle();
    expect(find.text(S.current.logout), findsNothing);

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // await tester.tap(find.text(S.current.logout));
    await tester.tap(find.widgetWithText(ElevatedButton, S.current.logout));

    await tester.pumpAndSettle();

    verify(() => mockProfileViewModel.doIntent(any(that: isA<LogoutClickedIntent>()))).called(1);
  });
}
