import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/login.dart';
import 'package:club_app/modules/login/loginCubit/loginCubit.dart';

import 'package:club_app/modules/replay/replay.dart';

import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/network/remote/dio_helper.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/blocObserver/blocObserver.dart';
import 'package:club_app/shared/const.dart';
import 'package:club_app/shared/style.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Widget startWidget;
  bool isDark = false;
  token = CacheHelper.getData(key: 'token');
  bool? onboarding = CacheHelper.getData(key: 'onBoarding');
  if (CacheHelper.getData(key: 'isDark') != null) {
    isDark = CacheHelper.getData(key: 'isDark');
  } else {
    isDark = isDark;
  }
  // if (token != null) {
  //   startWidget = HomeScreen();
  // } else {
  //   startWidget = LoginScreen();
  // }
  Widget examp = EasySplashScreen(
    backgroundImage: AssetImage('assets/images/splash.png'),
    showLoader: false,
    // loadingText: Text("Loading..."),
    navigator: token == null
        ? LoginScreen()
        : token == ''
            ? LoginScreen()
            : HomeScreen(),
    durationInSeconds: 3,
  );
  startWidget = examp;

  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp(
        isDark: isDark,
        startWidget: startWidget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  MyApp({required this.isDark, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..changeAppTheme(fromCache: isDark)
        ..getUserData()
        ..getClubs()
        ..getgovernorates()
        ..getCount()
        ..getproject()
        ..getReMarkerData()
        ..getNoteCategoryData()
        ..getDepartment()
        ..getLastClubs(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // arabic, no country code
            ],
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar'),
            title: 'home',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
            // home: LoginScreen(),
            builder: (context, child) {
              // print('____________________________-------------------------');
              // print(token);
              return MediaQuery(
                child: child!,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              );
            },
          );
        },
      ),
    );
  }
}
