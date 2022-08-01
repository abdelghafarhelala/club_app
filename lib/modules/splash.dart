import 'package:club_app/modules/home/home_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundImage: AssetImage('assets/images/splash.png'),
      showLoader: true,
      // loadingText: Text("Loading..."),
      navigator: HomeScreen(),
      durationInSeconds: 3,
    );
  }
}
