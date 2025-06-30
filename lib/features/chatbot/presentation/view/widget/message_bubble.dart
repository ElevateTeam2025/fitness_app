import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const MessageBubble({
    Key? key,
    required this.text,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isUser ? AppColors.primaryColor.withOpacity(0.5) : AppColors.containerBg,

            borderRadius: BorderRadius.only(
              topLeft: isUser ? const Radius.circular(16.0) : Radius.zero,
              topRight: isUser ? Radius.zero : const Radius.circular(16.0),
              bottomLeft: const Radius.circular(16.0),
              bottomRight:  const Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              color:  Colors.white ,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

}