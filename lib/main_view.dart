import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Button 1', style: AppTextStyles.BalooThambi2_500_18),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter text',
                hintText: 'Hint text',
                border: OutlineInputBorder(),
              ),
            ),
     CustomContainerWidget(body: [
              Text('This is a custom container', style: AppTextStyles.BalooThambi2_500_20.copyWith(color: AppColors.whiteColor)),
              ElevatedButton(
                onPressed: () {},
                child: Text('Click Me', style: AppTextStyles.BalooThambi2_500_14),
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}



