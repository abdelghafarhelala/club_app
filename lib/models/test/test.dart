import 'package:club_app/modules/update_profile/update_profile.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: defaultButton(
            onPress: () {
              navigateTo(context, UpdateProfileScreen());
            },
            text: 'go to update profile'),
      ),
    );
  }
}
