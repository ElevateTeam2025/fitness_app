import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/common/height_width_extention.dart';

import '../../../../domain/entity/section_json_model.dart';
import 'section_content_widget.dart';

class JsonContentBottomSheet extends StatefulWidget {
  final String assetPath;
  final String rootKey;

  const JsonContentBottomSheet({
    Key? key,
    required this.assetPath,
    required this.rootKey,
  }) : super(key: key);

  static void show(BuildContext context, {
    required String assetPath,
    required String rootKey,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => JsonContentBottomSheet(assetPath: assetPath, rootKey: rootKey),
    );
  }

  @override
  State<JsonContentBottomSheet> createState() => _JsonContentBottomSheetState();
}

class _JsonContentBottomSheetState extends State<JsonContentBottomSheet> with TickerProviderStateMixin {
  late PageController _pageController;
  List<Section> _sections = [];
  bool _loading = true;
  late String _locale;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadSections();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locale = Localizations.localeOf(context).languageCode;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadSections() async {
    final loaded = await Section.load(widget.assetPath, widget.rootKey);
    setState(() {
      _sections = loaded;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(30.RadiusResponsive),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(30.RadiusResponsive),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive, vertical: 24.HeightResponsive),
          child: PageView.builder(
            controller: _pageController,
            itemCount: _sections.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                  }
                  return Transform.scale(
                    scale: value,
                    child: Opacity(
                      opacity: value,
                      child: SectionContentWidget(
                        section: _sections[index],
                        index: index,
                        totalSections: _sections.length,
                        pageController: _pageController,
                        locale: _locale,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
