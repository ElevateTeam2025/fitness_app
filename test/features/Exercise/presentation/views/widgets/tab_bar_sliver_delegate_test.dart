import 'package:fitness_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/tab_bar_sliver_delegate.dart';

void main() {
  setUp(() {
    ScreenSizeService.width = 375;
    ScreenSizeService.height = 412;
  });
  testWidgets('TabBarSliverDelegate renders with correct radius and colors when collapsed and expanded', (tester) async {
    final tabBar = TabBar(
      tabs: const [
        Tab(text: 'Tab 1'),
        Tab(text: 'Tab 2'),
      ],
    );

    final delegateExpanded = TabBarSliverDelegate(tabBar: tabBar, isCollapsed: false);
    final delegateCollapsed = TabBarSliverDelegate(tabBar: tabBar, isCollapsed: true);
     // Not collapsed
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: delegateExpanded,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsWidgets);

    final containerWidget = tester.widget<Container>(containerFinder.first);
    final decoration = containerWidget.decoration as BoxDecoration;

    expect(decoration.gradient, isA<LinearGradient>());

    final gradient = decoration.gradient as LinearGradient;

    expect(gradient.colors[0].opacity, closeTo(0.7, 0.01));
    expect(gradient.colors[1].opacity, closeTo(0.5, 0.01));

    expect(decoration.borderRadius, isA<BorderRadius>());

    final borderRadius = decoration.borderRadius as BorderRadius;
    expect(borderRadius.bottomLeft.x, 32.RadiusResponsive);
    expect(borderRadius.bottomRight.x, 32.RadiusResponsive);

    // ------------------------------------------------
    //  collapsed
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: delegateCollapsed,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final containerWidgetCollapsed = tester.widget<Container>(containerFinder.first);
    final decorationCollapsed = containerWidgetCollapsed.decoration as BoxDecoration;

    expect(decorationCollapsed.gradient, isA<LinearGradient>());
    final gradientCollapsed = decorationCollapsed.gradient as LinearGradient;

    expect(gradientCollapsed.colors[0], AppColors.blackColor);
    expect(gradientCollapsed.colors[1], AppColors.blackColor);

    final borderRadiusCollapsed = decorationCollapsed.borderRadius as BorderRadius;
    expect(borderRadiusCollapsed.bottomLeft.x, 32.RadiusResponsive);
    expect(borderRadiusCollapsed.bottomRight.x, 32.RadiusResponsive);
  });
}
