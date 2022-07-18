import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

var oldPasswordController = TextEditingController();
var newPasswordController = TextEditingController();
var confirmNewPasswordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppChangePasswordSuccessState) {
          if (state.model?.success == true) {
            showToast(text: state.model?.message, state: ToastStates.success);
            navigateTo(context, HomeScreen());
          } else {
            showToast(text: state.model?.message, state: ToastStates.error);
          }
        } else if (state is AppSendEmailErrorState) {
          showToast(text: 'This Password is invalid', state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30,
              ),
            ),
            elevation: 0,
            title: const Image(
              image: AssetImage(
                'assets/images/name.png',
              ),
              width: 200,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    size: 34,
                    color: Colors.black,
                  ))
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              // For Android.
              // Use [light] for white status bar and [dark] for black status bar.
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
              // For iOS.
              // Use [dark] for white status bar and [light] for black status bar.
              statusBarBrightness: Brightness.dark,
            ),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight / 35),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight / 14,
                          ),
                          Text(
                            '''Change Password ''',
                            style: GoogleFonts.glory(),
                          ),
                          SizedBox(
                            height: screenHeight / 30,
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            elevation: 1.5,
                            child: defaultTextFieldWithCustomIconImage(
                                lable: 'Old Password',
                                controller: oldPasswordController,
                                prefix: const ImageIcon(
                                    AssetImage('assets/images/key.png')),
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'old Password can\'t be empty ';
                                  }
                                },
                                context: context,
                                type: TextInputType.emailAddress),
                          ),
                          SizedBox(
                            height: screenHeight / 34,
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            elevation: 1.5,
                            child: defaultTextFieldWithCustomIconImage(
                                controller: newPasswordController,
                                lable: 'New Password ',
                                prefix: const ImageIcon(
                                    AssetImage('assets/images/black_lock.png')),
                                suffix: AppCubit.get(context).suffix,
                                suffixPressed: () {
                                  AppCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                isSecure: AppCubit.get(context).isPass,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'New Password can\'t be empty ';
                                  }
                                },
                                context: context,
                                type: TextInputType.visiblePassword),
                          ),
                          SizedBox(
                            height: screenHeight / 34,
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            elevation: 1.5,
                            child: defaultTextFieldWithCustomIconImage(
                                controller: confirmNewPasswordController,
                                lable: 'Confirm New Password ',
                                prefix: const ImageIcon(
                                    AssetImage('assets/images/black_lock.png')),
                                suffix: AppCubit.get(context).suffixx,
                                suffixPressed: () {
                                  AppCubit.get(context)
                                      .changePasswordVisibilityy();
                                },
                                isSecure: AppCubit.get(context).isPasss,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Confirm New Password can\'t be empty ';
                                  }
                                },
                                context: context,
                                type: TextInputType.visiblePassword),
                          ),
                          SizedBox(
                            height: screenHeight / 35,
                          ),
                          ConditionalBuilder(
                            condition: state is! AppChangePasswordLoadingState,
                            builder: (context) => defaultButton(
                                height: screenHeight / 14,
                                onPress: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).updatePasswordData(
                                        oldPassword: oldPasswordController.text,
                                        newPassword: newPasswordController.text,
                                        confirmNewPassword:
                                            confirmNewPasswordController.text);
                                  } else {}
                                },
                                text: 'Update'),
                            fallback: (context) =>
                                const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
