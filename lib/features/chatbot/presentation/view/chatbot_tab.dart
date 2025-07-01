import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/build_chat_page.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/build_drawer_widget.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/build_get_started_widget.dart';
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

  bool _showGetStarted = true;

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
    if (_textController.text
        .trim()
        .isNotEmpty &&
        _chatBloc.state.currentChat != null) {
      _chatBloc.add(
        SendMessageEvent(
          _chatBloc.state.currentChat!,
          _textController.text.trim(),
        ),
      );
      _textController.clear();
    }
  }

  void _startChat() {
    setState(() {
      _showGetStarted = false;
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
              child: Image.asset(
                IconAssets.backIcon, color: AppColors.primaryColor,)),

          actions: [
            IconButton(
              icon: Icon(Icons.menu, color: AppColors.primaryColor,),
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
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _showGetStarted ? BuildGetStartedWidget(
                onGetStarted: _startChat, key: ValueKey("get_started"),):
              BuildChatPage(textController: _textController, scrollController: _scrollController, onSendMessage: _sendMessage)
              ,
            ),
          ],
        ),
      ),
    );
  }
}
