import 'package:flutter/material.dart';
import 'dart:async';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final VoidCallback? onComplete;


  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 50),
    this.onComplete,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with TickerProviderStateMixin {
  String _displayText = '';
  int _currentIndex = 0;
  Timer? _timer;
  late AnimationController _cursorController;
  late Animation<double> _cursorAnimation;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _cursorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_cursorController);
    _cursorController.repeat(reverse: true);
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.duration, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayText = widget.text.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
        
      } else {
        timer.cancel();
        _cursorController.stop();
        widget.onComplete?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: widget.style,
        children: [
          TextSpan(text: _displayText),
          if ( _currentIndex < widget.text.length)
            WidgetSpan(
              child: AnimatedBuilder(
                animation: _cursorAnimation,
                builder: (context, child) {
                  return Container(
                    width: 2,
                    height: (widget.style?.fontSize ?? 16) + 4,
                    margin: const EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      color: (widget.style?.color ?? Colors.white).withOpacity(
                        _cursorAnimation.value,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
