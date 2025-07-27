import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fitness_app/features/chatbot/data/model/chat_history_model.dart';
import 'package:fitness_app/core/utils/constant_manager.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../core/widgets/custom_dialog.dart';

class PreviousConversationsDrawer extends StatelessWidget {
  final Function(ChatHistoryModel) onChatSelected;

  const PreviousConversationsDrawer({super.key, required this.onChatSelected});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ChatHistoryModel>(AppConstants.boxName);
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.85),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Previous Conversations",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box<ChatHistoryModel> box, _) {
                  final chats = box.values.toList();
                  if (chats.isEmpty) {
                    return Center(
                      child: Text(
                        "No conversations yet.",
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: chats.length,
                    separatorBuilder: (_, __) =>
                        Divider(color: Colors.white12, height: 1),
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return Dismissible(
                        key: ValueKey(chat.id),
                        direction: DismissDirection.endToStart,

                        onDismissed: (direction) async {
                          DialogUtils.showMessage(
                            context: context,
                            title: "Delete Conversation",
                            message: "Are you sure you want to delete this conversation?",
                            negativeActionName: "Cancel",
                            negativeAction: () => Navigator.of(context).pop(),
                            postActionName: "Delete",
                            postAction: () async {
                              await chat.delete();
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.primaryColor,
                            size: 22,
                          ),
                          title: Text(
                            chat.title,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          onTap: () {
                            onChatSelected(chat);
                            Navigator.of(context).pop();
                          },
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 2,
                          ),
                          minLeadingWidth: 0,
                        ),
                      );
                    },
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
