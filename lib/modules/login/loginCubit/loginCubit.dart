// ignore_for_file: avoid_print

import 'package:club_app/models/userModel/userModel.dart';
import 'package:club_app/modules/login/loginCubit/loginStates.dart';
import 'package:club_app/network/endpoints.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPass = true;
  IconData suffix = Icons.visibility;
  void changePasswordVisibility() {
    isPass = !isPass;
    isPass ? suffix = Icons.visibility : suffix = Icons.visibility_off;
    emit(LoginPasswordShown());
  }

  UserModel? loginModel;
  void userLogin(
      {required String phone, required String password, required var context}) {
    emit(LoginLoadingState());
    DioHelper.postDataWithoutToken(url: loginUrl, data: {
      'email': phone,
      'password': password,
    }).then((value) {
      loginModel = UserModel.fromJson(value.data);
      // CacheHelper.saveData(key: 'token', value: loginModel?.token);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
