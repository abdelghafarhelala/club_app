// ignore_for_file: avoid_print

import 'dart:io';

import 'package:club_app/models/Department/department.dart';
import 'package:club_app/models/clubModel/clubs.dart';
import 'package:club_app/models/countModel/count.dart';
import 'package:club_app/models/governoratesModel/governorates.dart';
import 'package:club_app/models/lsat_clubs/last_clubs_model.dart';
import 'package:club_app/models/note_category/note_category_model.dart';
import 'package:club_app/models/notes/notes_model.dart';
import 'package:club_app/models/profile/profileModel.dart';
import 'package:club_app/models/projectModel/project.dart';
import 'package:club_app/models/remarker/remarker_model.dart';
import 'package:club_app/models/reset_password/reset_password.dart';
import 'package:club_app/models/send_email/send_email.dart';
import 'package:club_app/models/send_opt/send_opt.dart';
import 'package:club_app/models/userModel/userModel.dart';
import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/login.dart';
import 'package:club_app/network/endpoints.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/network/remote/dio_helper.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isFirst = true;

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

  ProfileModel? profile;
  void getUserData() {
    emit(AppGetUserDataLoadingState());
    DioHelper.getData(url: profileUrl, token: token).then((value) {
      // print(value.data);

      profile = ProfileModel.fromJson(value.data);
      print(profile?.data?.name);
      emit(AppGetUserDataSuccessState());
    }).catchError((error) {
      emit(AppGetUserDataErrorState());
      print(error.toString());
    });
  }

  List<String> updated = [];
  clubsModel? club;
  void getClubs() {
    emit(AppGetClubsLoadingState());
    DioHelper.getData(url: CLUBS, token: token).then((value) {
      print(value.data);
      club = clubsModel.fromJson(value.data);
      projectTypeList2.clear();
      club!.data!.forEach((element) {
        String result = element.updatedAt!.substring(0, 10);
        if (projectTypeList2.contains(result)) {
        } else {
          projectTypeList2.add(result);
        }
      });
      projectTypeList2.toSet().toList();
      print(projectTypeList2);
      emit(AppGetClubsSuccessState());
    }).catchError((onError) {
      emit(AppGetClubsErrorState());

      print(onError);
    });
  }

  LastClubsModel? lastClubs;
  void getLastClubs() {
    emit(AppGetLastClubsLoadingState());
    DioHelper.getData(url: CLUBS, token: token, query: {'limit': 4})
        .then((value) {
      print(value.data);
      lastClubs = LastClubsModel.fromJson(value.data);
      print(projectTypeList2);
      emit(AppGetLastClubsSuccessState());
    }).catchError((onError) {
      emit(AppGetLastClubsErrorState());

      print(onError);
    });
  }

  int? clubId;
  int? ProjectId;
  int? ProjectType;
  int? priorityId;
  String? updatedAt;
  // clubsModel? club;
  void getClubsFilteredWithGov(
      // int? clubId,
      // int? ProjectId,
      // String? updatedAt,
      // int? ProjectType,
      ) {
    emit(AppGetClubsFilteredWithGovLoadingState());
    DioHelper.getData(
            url: CLUBS,
            query: {
              'priority': priorityId,
              'governorate': clubId,
              'project': ProjectId,
              'updated_at': updatedAt,
              'project_type': ProjectType,
            },
            token: token)
        .then((value) {
      // print(value.data);
      club = clubsModel.fromJson(value.data);
      print(value.data);

      emit(AppGetClubsFilteredWithGovSuccessState());
    }).catchError((onError) {
      emit(AppGetClubsFilteredWithGovErrorState());

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
      print(onError.toString());
      emit(AppGetProjectErrorState());
    });
  }

  UserModel? user;
  void updateUserData({
    required String email,
    required String phone,
    required String name,
    required String jobTitle,
    required int departmentId,
  }) {
    emit(AppUpdateUserDataLoadingState());
    DioHelper.putData(url: updateProfile, token: token, data: {
      'email': email,
      'mobile_number': phone,
      'name': name,
      'department_id': departmentId,
      'job_title': jobTitle,
    }).then((value) {
      user = UserModel.fromJson(value.data);
      print(user?.message);
      getUserData();

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

  String? Drop_Down_Value2;
  void set_drop2({required String? x}) {
    Drop_Down_Value2 = x;
    emit(AppGetChangeDrop2State());
  }

  String? Drop_Down_Value3;
  void set_drop3({required String? x}) {
    Drop_Down_Value3 = x;
    emit(AppGetChangeDrop3State());
  }

  String? Drop_Down_Value4;
  void set_drop4({required String? x}) {
    Drop_Down_Value4 = x;
    emit(AppGetChangeDrop4State());
  }

  String? Drop_Down_Value5;
  void set_drop5({required String? x}) {
    Drop_Down_Value5 = x;
    emit(AppGetChangeDrop4State());
  }

  String? Dep_Value;
  void set_Dep({required String? x}) {
    Dep_Value = x;
    emit(AppGetChangeDropState());
  }

  //LogOut Form app
  // void logOut() {
  //   DioHelper.postData(url: logOutUrl, data: {}, token: token).then((value) {
  //     emit(AppLogOutSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(AppLogOutErrorState());
  //   });
  // }
  void logOut(context) {
    CacheHelper.removeData(key: 'token').then((value) {
      if (value) {
        profile = null;
        navigateAndFinish(context, LoginScreen());
        emit(AppLogOutSuccessState());
      }
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

  departments? department;
  List<DepartData> departData = [];
  void getDepartment() {
    emit(AppGetdepartmentsLoadingState());
    DioHelper.getData(url: DEPARTMENTS, token: token).then((value) {
      department = departments.fromJson(value.data);
      departData = department!.data!;
      emit(AppGetdepartmentsSuccState());
    }).catchError((onError) {
      emit(AppGetdepartmentsErrorState());
    });
  }

  NoteCategoryModel? noteCategoryModel;
  void getNoteCategoryData() {
    emit(AppGetNoteCategoryLoadingState());
    DioHelper.getData(url: noteCategoryUrl, token: token).then((value) {
      noteCategoryModel = NoteCategoryModel.fromJson(value.data);
      emit(AppGetNoteCategorySuccessState(noteCategoryModel));
    }).catchError((onError) {
      emit(AppGetNoteCategoryErrorState());
    });
  }

  CountModel? Count;
  void getCount() {
    emit(AppGetcountLoadingState());
    DioHelper.getData(url: GETCOUNT, token: token).then((value) {
      Count = CountModel.fromJson(value.data);
      emit(AppGetcountSuccState());
    }).catchError((onError) {
      emit(AppGetcountErrorState());
    });
  }

  //change password
  void updatePasswordData({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) {
    emit(AppChangePasswordLoadingState());
    DioHelper.putData(url: changePasswordUrl, token: token, data: {
      'password': oldPassword,
      'new_password': newPassword,
      'password_confirmation': confirmNewPassword,
    }).then((value) {
      user = UserModel.fromJson(value.data);
      print(user?.message);
      emit(AppChangePasswordSuccessState(user));
    }).catchError((error) {
      emit(AppChangePasswordErrorState());
      print(error.toString());
    });
  }

  var selectedItem;
  var selectedItem2;
  void changeListVal(val) {
    selectedItem = val;
    emit(AppchangeListValState());
  }

  void changeListVal2(val) {
    selectedItem2 = val;
    emit(AppchangeListValState());
  }

  //get remarkers
  RemarkerModel? remarkerModel;
  void getReMarkerData({int? club_id}) {
    emit(AppGetRemarkerLoadingState());
    DioHelper.getData(url: reMarkerUrl, token: token, query: {'club': club_id})
        .then((value) {
      print(value.data);

      remarkerModel = RemarkerModel.fromJson(value.data);
      emit(AppGetRemarkerSuccessState(remarkerModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(AppGetRemarkerErrorState());
    });
  }

  void getSingeReMarkerData({required int id}) {
    emit(AppGetSingleRemarkerLoadingState());
    DioHelper.getData(url: '${reMarkerUrl}/$id', token: token).then((value) {
      emit(AppGetSingleRemarkerSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppGetSingleRemarkerErrorState());
    });
  }

  void filterRemarks() {}
  List filter = [];
  bool isFilterd = false;
  void getCategoryList(List<dynamic> inputlist) {
    List outputList =
        inputlist.where((o) => o.noteCategory == '$Dep_Value').toList();
    filter = outputList;
    isFilterd = true;
    emit(appIsFilterdState());
  }

  void clickPriority({required int click, required int num}) {
    click = num;
    emit(AppClickPriorityState());
  }

//pic image
  // File? postImage;
  var picker = ImagePicker();
  // Future<void> getImageFromGalley() async {
  //   final pickerFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickerFile != null) {
  //     postImage = File(pickerFile.path);
  //     emit(AppPickImageSuccessState());
  //   } else {
  //     print('No Image Selected');
  //     emit(AppPickImageErrorState());
  //   }
  // }

  // Future<void> getImageFromCamera() async {
  //   final pickerFile = await picker.pickImage(source: ImageSource.camera);

  //   if (pickerFile != null) {
  //     postImage = File(pickerFile.path);
  //     emit(AppPickImageSuccessState());
  //   } else {
  //     print('No Image Selected');
  //     emit(AppPickImageErrorState());
  //   }
  // }

  // void removeImage() {
  //   postImage = null;
  //   emit(AppRemovePickImageState());
  // }

  //post note
  // NotesModel? notesModel;
  // void postNoteData({
  //   int catId = 1,
  //   required int priorityId,
  //   required int ClubId,
  //   required int EmployeeId,
  //   required String description,
  // }) async {
  //   String? fileName = postImage?.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "file_path": await MultipartFile.fromFile(
  //       postImage?.path ?? '',
  //       filename: fileName,
  //       contentType: new MediaType("image", "jpeg"), //important
  //     ),
  //     'note_category_id': catId,
  //     'priority_id': priorityId,
  //     'club_id': ClubId,
  //     'employee_id': EmployeeId,
  //     'desc': description,
  //   });
  //   emit(AppPostNoteLoadingState());
  //   Dio dio = new Dio()..options.baseUrl = "https://estadat.ivas.com.eg/api/";
  //   dio
  //       .post(newNoteUrl,
  //           data: formData,
  //           options: Options(headers: {
  //             'Authorization': token!,
  //           }))
  //       .then((response) {
  //     notesModel = NotesModel.fromJson(response.data);
  //     emit(AppPostNoteSuccessState(notesModel));
  //     print(response);
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(AppPostNoteErrorState());
  //   });
  // }

  //////////////////////////////////////////////////
  ///////////////////////////////////////////////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  NotesModel? notesModel;
  List<XFile>? imageFileList = [];
  Future<void> getImageFromGalley() async {
    final List<XFile>? images = await picker.pickMultiImage();

    if (images!.isNotEmpty) {
      // PostImage != (File(pickerFile.path));
      imageFileList!.addAll(images);
      emit(AppPickImageSuccessState());
    } else {
      print('No Image Selected');
      emit(AppPickImageErrorState());
    }
  }

  // Future<void> getImageFromCamera(File PostImage) async {
  //   final pickerFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickerFile != null) {
  //     PostImage = (File(pickerFile.path));
  //     emit(AppPickImageSuccessState());
  //   } else {
  //     print('No Image Selected');
  //     emit(AppPickImageErrorState());
  //   }
  // }

  void removeImage(file) {
    imageFileList!.remove(file);
    emit(AppRemovePickImageState());
  }

  List<String>? fileName = [];
  void fun() {
    imageFileList!.forEach((element) {
      fileName!.add(element.path.split('/').last);
    });
  }

  void postNoteDataImage({
    required int catId,
    required int priorityId,
    required int ClubId,
    required int EmployeeId,
    required String description,
  }) async {
    // String? fileName = imageFileList![0].path.split('/').last;
    fun();
    FormData formData = FormData.fromMap({
      if (imageFileList!.length > 0)
        "files[0]": await MultipartFile.fromFile(
          imageFileList![0].path,
          filename: fileName![0],
          contentType: new MediaType("image", "jpeg"), //important
        ),
      if (imageFileList!.length > 1)
        "files[1]": await MultipartFile.fromFile(
          imageFileList![1].path,
          filename: fileName![1],
          contentType: new MediaType("image", "jpeg"), //important
        ),
      if (imageFileList!.length > 2)
        "files[2]": await MultipartFile.fromFile(
          imageFileList![2].path,
          filename: fileName![2],
          contentType: new MediaType("image", "jpeg"), //important
        ),
      if (imageFileList!.length > 3)
        "files[3]": await MultipartFile.fromFile(
          imageFileList![3].path,
          filename: fileName![3],
          contentType: new MediaType("image", "jpeg"), //important
        ),
      if (imageFileList!.length > 4)
        "files[4]": await MultipartFile.fromFile(
          imageFileList![4].path,
          filename: fileName![4],
          contentType: new MediaType("image", "jpeg"), //important
        ),
      if (imageFileList!.length > 5)
        "files[5]": await MultipartFile.fromFile(
          imageFileList![5].path,
          filename: fileName![5],
          contentType: new MediaType("image", "jpeg"), //important
        ),
      'note_category_id': catId,
      'priority_id': priorityId,
      'club_id': ClubId,
      'employee_id': EmployeeId,
      'desc': description,
    });
    emit(AppPostNoteLoadingState());
    Dio dio = new Dio()..options.baseUrl = "https://estadat.ivas.com.eg/api/";
    dio
        .post(newNoteUrl,
            data: formData,
            options: Options(headers: {
              'Authorization': token!,
            }))
        .then((response) {
      print('object object object ${response.data}');

      notesModel = NotesModel.fromJson(response.data);
      getReMarkerData();
      emit(AppPostNoteSuccessState(notesModel));
      print(response);
    }).catchError((error) {
      print(error.toString());
      emit(AppPostNoteErrorState());
    });
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
/////////////////////////////////////

  void postNoteDataWithoutImage({
    int catId = 1,
    required int priorityId,
    required int ClubId,
    required int EmployeeId,
    required String description,
  }) async {
    // String? fileName = postImage?.path.split('/').last;
    FormData formData = FormData.fromMap({
      // "file_path": await MultipartFile.fromFile(
      //   postImage?.path??'',
      //   filename: fileName,
      //   contentType: new MediaType("image", "jpeg"), //important
      // ),
      'note_category_id': catId,
      'priority_id': priorityId,
      'club_id': ClubId,
      'employee_id': EmployeeId,
      'desc': description,
    });
    emit(AppPostNoteLoadingState());
    Dio dio = new Dio()..options.baseUrl = "https://estadat.ivas.com.eg/api/";
    dio
        .post(newNoteUrl,
            data: formData,
            options: Options(headers: {
              'Authorization': token!,
            }))
        .then((response) {
      notesModel = NotesModel.fromJson(response.data);
      emit(AppPostNoteSuccessState(notesModel));
      print(response);
    }).catchError((error) {
      print(error.toString());
      emit(AppPostNoteErrorState());
    });
  }

//   void _upload() async {
//    String fileName = postImage!.path.split('/').last;

//    FormData data = FormData.fromMap({
//       "file": await MultipartFile.fromFile(
//         postImage!.path,
//         filename: fileName,
//       ),
//    });

//   // Dio dio = new Dio();

//   // dio.post("https://estadat.ivas.com.eg/api/$newNoteUrl", data: data)
//   // .then((response) => print(response))
//   // .catchError((error) => print(error));
// }

  Color cityColor = Colors.grey;
  var cityIndex = 40;

  void changeCityColor(index) {
    cityColor = Colors.grey;
    cityIndex = index;
    emit(AppChangeCityColorState());
  }

  int index = 0;
  void countIndex() {
    index++;
    emit(AppCountIndexState());
  }

  void count2Index() {
    index--;
    emit(AppCountIndexState());
  }

  int? c = 0;
  int changeEye(int seen) {
    if (seen == 0) {
      seen = 1;
    }
    c = seen;
    emit(AppChangeEyeState());

    return seen;
  }
}
