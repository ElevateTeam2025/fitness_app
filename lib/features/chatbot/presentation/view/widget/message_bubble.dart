import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'typewriter_text.dart';

class MessageBubble extends StatefulWidget {
  final String? text;
  final bool isUser;
  final bool isSkeleton;
  final bool useTypewriter;

  const MessageBubble({
    super.key,
    this.text,
    required this.isUser,
    this.isSkeleton = false,
    this.useTypewriter = false,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeController);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Align(
        alignment: widget.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: widget.isUser
                  ? AppColors.primaryColor.withOpacity(0.5)
                  : AppColors.containerBg,
              borderRadius: BorderRadius.only(
                topLeft: widget.isUser
                    ? const Radius.circular(16.0)
                    : Radius.zero,
                topRight: widget.isUser
                    ? Radius.zero
                    : const Radius.circular(16.0),
                bottomLeft: const Radius.circular(16.0),
                bottomRight: const Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: widget.isSkeleton
                ? Skeletonizer(
                    enabled: true,
                    containersColor: AppColors.greyColor,
                    child: SizedBox(width: 120, height: 20),
                  )
                : widget.useTypewriter && !widget.isUser
                ? TypewriterText(
                    text: widget.text ?? "",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                    duration:
                        const Duration(milliseconds: 30),
                  )
                : Text(
                    widget.text ?? "",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                  ),
          ),
        ),
      ),
    );
  }
}
