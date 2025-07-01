import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../manager/bloc/chat_bloc.dart';
import '../../manager/bloc/chat_event.dart';
import '../../manager/bloc/chat_state.dart';

class BuildDrawerWidget extends StatelessWidget {
  const BuildDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();

    return Drawer(
      backgroundColor:AppColors.containerBg,
      child: SafeArea(
        child: Column(
          children: [
               Padding(
                 padding:  EdgeInsets.only(bottom: 24.WidthResponsive),
                 child: Text(
                  'Previous conversations',
                  style: AppTextStyles.BalooThambi2_500_18.copyWith(color: AppColors.whiteColor)

                             ),
               ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                final sortedChats = List.from(state.chatHistory)
                  ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

                if (sortedChats.isEmpty) {
                  return const Expanded(
                    child: Center(child: Text('No chat history yet')),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: sortedChats.length,
                    itemBuilder: (context, index) {
                      final chat = sortedChats[index];
                      return ListTile(
                        title: Text(
                          chat.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: AppTextStyles.BalooThambi2_600_12.copyWith(color: AppColors.whiteColor),
                        ),

                        leading: Icon(Icons.arrow_back_ios_new_sharp,color: AppColors.primaryColor,),
                        selected: state.currentChat?.id == chat.id,
                        selectedTileColor: AppColors.primaryColor.withOpacity(0.1),
                        onTap: () {
                          chatBloc.add(LoadChatMessagesEvent(chat.id));
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                );
              },
            ),

            ListTile(

              leading: const Icon(Icons.delete_forever,color: Colors.red,),
              title:  Text('Clear All History',style: AppTextStyles.BalooThambi2_400_13.copyWith(color: AppColors.whiteColor),),
              onTap: () {
                context.read<ChatBloc>().add(ClearAllChatsEvent());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
