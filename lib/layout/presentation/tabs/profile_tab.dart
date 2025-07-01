import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, PagesRoutes.editProfile);
          },
          child: Text('Go to Profile edit page'),
        ),
      ],
    );
  }
}
