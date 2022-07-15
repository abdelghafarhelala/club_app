// ignore_for_file: avoid_print

import 'package:club_app/models/clubModel/clubs.dart';
import 'package:club_app/models/governoratesModel/governorates.dart';
import 'package:club_app/models/projectModel/project.dart';
import 'package:club_app/models/reset_password/reset_password.dart';
import 'package:club_app/models/send_email/send_email.dart';
import 'package:club_app/models/send_opt/send_opt.dart';
import 'package:club_app/models/userModel/userModel.dart';
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

  bool isPass = true;
  IconData suffix = Icons.visibility;
  void changePasswordVisibility() {
    isPass = !isPass;
    isPass ? suffix = Icons.visibility : suffix = Icons.visibility_off;
    emit(PasswordShownState());
  }

  bool isPasss = true;
  IconData suffixx = Icons.visibility;
  void changePasswordVisibilityy() {
    isPasss = !isPasss;
    isPasss ? suffixx = Icons.visibility : suffixx = Icons.visibility_off;
    emit(PasswordShownStatee());
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

  clubsModel? club;
  void getClubs() {
    emit(AppGetClubsLoadingState());
    DioHelper.getData(url: CLUBS, token: token).then((value) {
      club = clubsModel.fromJson(value.data);

// print(club!.data![0].city);
      emit(AppGetClubsSuccessState());
    }).catchError((onError) {
      emit(AppGetClubsErrorState());

      print(onError);
    });
  }

  governoratesModel? governorate;
  void getgovernorates() {
    emit(AppGetgovernoratesLoadingState());
    DioHelper.getData(url: GOVERNORATES, token: token).then((value) {
      governorate = governoratesModel.fromJson(value.data);
      print(governorate!.data![0].nameEn);
      emit(AppGetgovernoratesSuccessState());
    }).catchError((onError) {
      emit(AppGetgovernoratesErrorState());
    });
  }

  projects? project;
  void getproject() {
    emit(AppGetProjectLoadingState());
    DioHelper.getData(url: PROJECTS, token: token).then((value) {
      project = projects.fromJson(value.data);
      emit(AppGetProjectSuccessState());
    }).catchError((onError) {
      emit(AppGetProjectErrorState());
    });
  }

  UserModel? user;
  void updateUserData({
    required String email,
    required String phone,
    required String name,
    required String password,
    required String jobTitle,
    required int departmentId,
  }) {
    emit(AppUpdateUserDataLoadingState());
    DioHelper.putData(url: updateProfile, token: token, data: {
      'email': email,
      'mobile': phone,
      'name': name,
      'password': password,
      'department_id': departmentId,
      'job_title': jobTitle,
    }).then((value) {
      user = UserModel.fromJson(value.data);
      print(user?.message);
      emit(AppUpdateUserDataSuccessState(user));
    }).catchError((error) {
      emit(AppUpdateUserDataErrorState());
      print(error.toString());
    });
  }

  String? Drop_Down_Value;
  void set_drop({required String? x}) {
    Drop_Down_Value = x;
    emit(AppGetChangeDropState());
  }

  String? Dep_Value;
  void set_Dep({required String? x}) {
    Dep_Value = x;
    emit(AppGetChangeDropState());
  }

  //LogOut Form app
  void logOut() {
    DioHelper.postData(url: logOutUrl, data: {}, token: token).then((value) {
      emit(AppLogOutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppLogOutErrorState());
    });
  }

  SendEmailModel? sendEmailModel;
  void sendEmail({required String email}) {
    emit(AppSendEmailLoadingState());
    DioHelper.postData(url: sendEmailUrl, data: {'email': email}, token: token)
        .then((value) {
      sendEmailModel = SendEmailModel.fromJson(value.data);
      emit(AppSendEmailSuccessState(sendEmailModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppSendEmailErrorState());
    });
  }

  SendOptModel? sendOptModel;
  void sendOpt({required String email, required String opt}) {
    emit(AppSendOptLoadingState());
    DioHelper.postData(
            url: checkOptUrl,
            data: {
              'email': email,
              'pincode': opt,
            },
            token: token)
        .then((value) {
      sendOptModel = SendOptModel.fromJson(value.data);
      emit(AppSendOptSuccessState(sendOptModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppSendOptErrorState());
    });
  }

  ResetPasswordModel? resetPasswordModel;
  void resetPassword({
    required String email,
    required String opt,
    required String password,
    required String confirmPassword,
  }) {
    emit(AppRestPasswordLoadingState());
    DioHelper.postData(
            url: checkOptUrl,
            data: {
              'email': email,
              'pincode': opt,
              'password': password,
              'password_confirmation': confirmPassword,
            },
            token: token)
        .then((value) {
      resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      emit(AppRestPasswordSuccessState(resetPasswordModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppRestPasswordErrorState());
    });
  }

  var foush = '';
}
