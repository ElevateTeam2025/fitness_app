import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/custom_chatbot_row.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/custom_get_started_body.dart';
import 'package:flutter/material.dart';

class ChatbotTab extends StatelessWidget {
  const ChatbotTab({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final bool isShow = false;
    return Scaffold(
        key: scaffoldKey,
        endDrawer: Drawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.backgroundChatbot),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 34.HeightResponsive),
              CustomChatbotRow(
                onPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              SizedBox(height: 25.HeightResponsive),
              isShow == true
                  ? CustomGetStartedBody()
                  : Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {},
                      ),
                    ),
                    TextFormField(
                    ),
                    SizedBox(height: 25.HeightResponsive),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
