import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDraggableDialog extends StatefulWidget {
  final String youtubeUrl;

  const VideoDraggableDialog({super.key, required this.youtubeUrl});

  @override
  State<VideoDraggableDialog> createState() => _VideoDraggableDialogState();
}

class _VideoDraggableDialogState extends State<VideoDraggableDialog> with SingleTickerProviderStateMixin {
  Offset? position;
  late YoutubePlayerController _controller;
  late AnimationController _animController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl) ?? '';
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeInOutCubic));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeInOutCubic));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      setState(() {
        position = Offset(16, (screenSize.height / 2) - 140);
        _animController.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: closeDialog,
            child: Container(color: Colors.transparent),
          ),

          if (position != null)
            Positioned(
              left: position!.dx,
              top: position!.dy,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    position = position! + details.delta;
                  });
                },
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: Container(
                      width: screenWidth - 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(12),
                          vertical: responsiveHeight(12)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(AppIcons.openYoutube, color: AppColors.whiteColor),
                                onPressed: () async {
                                  final uri = Uri.parse(widget.youtubeUrl);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(AppIcons.closeIcon,color: AppColors.whiteColor),
                                onPressed: closeDialog,
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.RadiusResponsive),
                            child: SizedBox(
                              height: responsiveHeight(235),
                              child: YoutubePlayer(
                                controller: _controller,
                                showVideoProgressIndicator: true,
                                width: screenWidth - 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void closeDialog() async {
    await _animController.reverse();
    if (mounted) Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animController.dispose();
    super.dispose();
  }
}
