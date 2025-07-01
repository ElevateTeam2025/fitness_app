import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/user_information_widget.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/services/screen_size_service.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('UserInformationWidget displays user data correctly', (tester) async {
    final userWithPhoto = UserData(
      firstName: 'Faten',
      lastName: 'Khalid',
      photo: 'https://example.com/photo.jpg',
    );

    final userWithoutPhoto = UserData(
      firstName: 'User',
      lastName: 'Test',
      photo: '',
    );

    // Use mockNetworkImagesFor to mock network images loading
    await mockNetworkImagesFor(() async {
      //  (NetworkImage)
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInformationWidget(userData: userWithPhoto),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Faten'), findsOneWidget);
      expect(find.text('Khalid'), findsOneWidget);

      final circleAvatarFinder = find.byType(CircleAvatar);
      expect(circleAvatarFinder, findsOneWidget);

      final CircleAvatar avatar = tester.widget(circleAvatarFinder);
      expect(avatar.backgroundImage, isA<NetworkImage>());
      final NetworkImage networkImage = avatar.backgroundImage as NetworkImage;
      expect(networkImage.url, equals('https://example.com/photo.jpg'));

      //  (AssetImage)
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInformationWidget(userData: userWithoutPhoto),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('User'), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);

      final CircleAvatar avatar2 = tester.widget(circleAvatarFinder);
      expect(avatar2.backgroundImage, isA<AssetImage>());
      final AssetImage assetImage = avatar2.backgroundImage as AssetImage;
      expect(assetImage.assetName, equals(ImageAssets.logo));
    });
  });
}
