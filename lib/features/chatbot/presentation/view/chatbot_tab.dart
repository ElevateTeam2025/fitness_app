import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_dialog.dart';
import 'package:fitness_app/features/chatbot/presentation/manager/chatbot_state.dart';
import 'package:fitness_app/features/chatbot/presentation/manager/chatbot_view_model.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/custom_chatbot_row.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/custom_get_started_body.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/message_bubble.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/previous_conversations_drawer.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotTab extends StatelessWidget {
  const ChatbotTab({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<ChatbotViewModel>();
    final tr = S.of(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        key: viewModel.scaffoldKey,
        endDrawer: PreviousConversationsDrawer(
          onChatSelected: (chat) {
            viewModel.loadChat(chat);
          },
        ),
        body: BlocConsumer<ChatbotViewModel, ChatbotState>(
          listener: (context, state) {
            if (state is SendMessageErrorState) {
              DialogUtils.showMessage(
                context: context,
                message: state.message,
                title: tr.error,
                postActionName: tr.ok,
              );
            }
          },
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.backgroundChatbot),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 34.heightResponsive),
                  Row(
                    children: [
                      Expanded(
                        child: CustomChatbotRow(
                          onPressed: () {
                            viewModel.scaffoldKey.currentState?.openEndDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.heightResponsive),
                  viewModel.isShowChat == true
                      ? Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: viewModel.messages.length,
                                  itemBuilder: (context, index) {
                                    return MessageBubble(
                                      text: viewModel.messages[index].message,
                                      isUser: viewModel.messages[index].isUser,
                                      isSkeleton:
                                          viewModel.messages[index].isSkeleton,
                                      useTypewriter:
                                          !viewModel.messages[index].isUser,
                                    );
                                  },
                                ),
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          viewModel.textEditingController,
                                      style:
                                          AppTextStyles
                                              .BalooThambi2_800_14.copyWith(
                                            color: AppColors.whiteColor,
                                          ),
                                      onChanged: (value) {
                                        viewModel.inputText.value = value;
                                      },
                                    ),
                                  ),
                                  ValueListenableBuilder<String>(
                                    valueListenable: viewModel.inputText,
                                    builder: (context, value, child) {
                                      return IconButton(
                                        onPressed: value.trim().isNotEmpty
                                            ? () {
                                                viewModel.doIntent(
                                                  SendMessageIntent(),
                                                );
                                                viewModel.textEditingController
                                                    .clear();
                                              }
                                            : null,
                                        icon: Icon(
                                          Icons.send,
                                          color: value.trim().isNotEmpty
                                              ? AppColors.primaryColor
                                              : AppColors.greyColor,
                                          size: 30,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),

                              SizedBox(height: 25.heightResponsive),
                            ],
                          ),
                        )
                      : Expanded(child: CustomGetStartedBody()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _getSpeedLabel(Duration duration) {
    if (duration.inMilliseconds <= 15) return 'سريع جداً';
    if (duration.inMilliseconds <= 30) return 'سريع';
    if (duration.inMilliseconds <= 50) return 'متوسط';
    if (duration.inMilliseconds <= 80) return 'بطيء';
    return 'بطيء جداً';
  }
}
