import 'package:fitness_app/features/chatbot/presentation/manager/bloc/chat_bloc.dart';
import 'package:fitness_app/features/chatbot/presentation/manager/bloc/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import 'message_bubble.dart';

class BuildChatPage extends StatelessWidget {
  final TextEditingController textController;
  final ScrollController scrollController;
  final VoidCallback onSendMessage;

  const BuildChatPage({
    super.key,
    required this.textController,
    required this.scrollController,
    required this.onSendMessage,
  }); void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ChatBloc, ChatState>(
        
        listener: (context, state) {
          if(state.status == ChatStatus.loaded && state.currentChat != null){
            Future.delayed(Duration(milliseconds: 100),() {
              _scrollToBottom();
            },);
          }
          if (state.errorMessage != null) {
            print(state.errorMessage);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red.withOpacity(0.5),
              ),
            );
          }
      },
        builder: (context, state) {
          if (state.status == ChatStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          final messages = state.currentChat?.messages ?? [];
          return Column(
            children: [
              Expanded(
                child: messages.isEmpty
                    ? const SizedBox.shrink()
                    : ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
      
                    return MessageBubble(
                      text: message.content,
                      isUser: message.role == 'user',
                    );
                  },
                ),
              ),
              if (state.isSendingMessage)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Gemini is typing...',
                        style: AppTextStyles.BalooThambi2_400_13.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -2),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller:textController ,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.send,
                        onFieldSubmitted: (_) => onSendMessage(),
                        enabled: !state.isSendingMessage,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: state.isSendingMessage ? null : onSendMessage,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
