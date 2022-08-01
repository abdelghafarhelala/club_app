// ignore_for_file: avoid_print

import 'package:club_app/models/userModel/userModel.dart';
import 'package:club_app/modules/register/registerCubit/registerStates.dart';
import 'package:club_app/network/endpoints.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/network/remote/dio_helper.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPass = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPass = !isPass;
    isPass
        ? suffix = Icons.visibility_outlined
        : suffix = Icons.visibility_off_outlined;
    emit(RegisterPasswordShown());
  }

  UserModel? registerModel;
  void userRegister({
    required String email,
    required String phone,
    required String name,
    required String password,
    required String jobTitle,
    required int departmentId,
    required context,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postDataWithoutToken(url: registerUrl, data: {
      'email': email,
      'mobile': phone,
      'name': name,
      'password': password,
      'department_id': departmentId,
      'job_title': jobTitle,
    }).then((value) {
      registerModel = UserModel.fromJson(value.data);
      // print(registerModel!.data!.name);
      CacheHelper.saveData(key: 'token', value: registerModel?.token);
      token = registerModel?.token;
      AppCubit.get(context).getUserData();
      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }
}
