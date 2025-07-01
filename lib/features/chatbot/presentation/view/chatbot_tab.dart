import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/build_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/app_assets.dart';
import '../manager/bloc/chat_bloc.dart';
import '../manager/bloc/chat_event.dart';
import '../manager/bloc/chat_state.dart';
import 'widget/message_bubble.dart';

class ChatbotTab extends StatefulWidget {
  const ChatbotTab({super.key});

  @override
  State<ChatbotTab> createState() => _ChatbotTabState();
}

class _ChatbotTabState extends State<ChatbotTab> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = GetIt.instance.get<ChatBloc>();
    _chatBloc.add(LoadAllChatsEvent());
    _chatBloc.add(NewChatEvent());
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _chatBloc.close();
    super.dispose();
  }

  void _sendMessage() {
    if (_textController.text.trim().isNotEmpty &&
        _chatBloc.state.currentChat != null) {
      _chatBloc.add(
        SendMessageEvent(
          _chatBloc.state.currentChat!,
          _textController.text.trim(),
        ),
      );
      _textController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _chatBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,

          centerTitle: true,
          title: Text(
            'Smart Coach',
            style: AppTextStyles.BalooThambi2_800_24.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(IconAssets.backIcon,color: AppColors.primaryColor,)),

          actions: [
            IconButton(
              icon:  Icon(Icons.menu,color: AppColors.primaryColor,),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
        ),
        endDrawer: BuildDrawerWidget(),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(ImageAssets.chatPageBg, fit: BoxFit.cover),
            ),
            SafeArea(
              child: BlocConsumer<ChatBloc, ChatState>(
                listener: (context, state) {
                  if (state.status == ChatStatus.loaded &&
                      state.currentChat != null) {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      _scrollToBottom();
                    });
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
                            ? SizedBox.shrink()
                            : ListView.builder(
                                controller: _scrollController,
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
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('Gemini is typing...',style: AppTextStyles.BalooThambi2_400_13.copyWith(color: AppColors.whiteColor),),
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
                                controller: _textController,
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
                                onFieldSubmitted: (_) => _sendMessage(),
                                enabled: !state.isSendingMessage,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            IconButton(
                              icon:  Icon(Icons.send,color: AppColors.primaryColor,),
                              onPressed: state.isSendingMessage
                                  ? null
                                  : _sendMessage,


                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
