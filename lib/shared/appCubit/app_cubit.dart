// ignore_for_file: avoid_print

import 'package:club_app/models/userModel/userModel.dart';
import 'package:club_app/modules/club_details/club_details.dart';
import 'package:club_app/network/endpoints.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/network/remote/dio_helper.dart';
import 'package:club_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isFirst = true;
  List<BottomNavigationBarItem> buttomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسيه'),
    const BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'الخدمات'),
    const BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'اتصل بنا'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.post_add_outlined), label: 'الحجز'),
  ];
  List<String> titles = [
    'الرئيسيه',
    'الخدمات',
    'اتصل بنا',
    'الحجز',
  ];
  List<Widget> appScreens = [
    // const HomeScreen(),
    // const MainServicesScreen(),
    // const ContactUsScreen(),
    // BookingScreen(),
  ];

  int currentIndex = 0;

  void changeAppNav(index) {
    currentIndex = index;
    emit(ChangeNavButtomNavState());
  }

  var isDark = true;
  void changeAppTheme({bool? fromCache}) {
    if (fromCache != null) {
      isDark = fromCache;
      emit(AppChangeThemState());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemState());
      });
    }
  }

//get user

  UserModel? profile;
  void getUserData() {
    emit(AppGetUserDataLoadingState());
    DioHelper.getData(url: profileUrl, token: token).then((value) {
      profile = UserModel.fromJson(value.data);
      print(profile!.user!.name);
      emit(AppGetUserDataSuccessState());
    }).catchError((error) {
      emit(AppGetUserDataErrorState());
      print(error.toString());
    });
  }
}
