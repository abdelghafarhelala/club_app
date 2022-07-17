import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/login.dart';
import 'package:club_app/modules/login/loginCubit/loginCubit.dart';
import 'package:club_app/modules/login/loginCubit/loginStates.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

var formKey = GlobalKey<FormState>();
var passController = TextEditingController();
var confirmPassController = TextEditingController();

class ResetPassword extends StatelessWidget {
  final String? email;
  final String? code;
  const ResetPassword({Key? key, required this.email, required this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppRestPasswordSuccessState) {
          if (state.model?.success == true) {
            showToast(text: state.model?.message, state: ToastStates.success);
            navigateAndFinish(context, HomeScreen());
          } else {
            showToast(text: state.model?.message, state: ToastStates.error);
          }
        } else if (state is AppRestPasswordErrorState) {
          showToast(
              text: 'The two passwords aren\'t the same',
              state: ToastStates.error);
        }
      },
      builder: (context, state) {
        double screenHeight = MediaQuery.of(context).size.height;
        return Scaffold(
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
                          EdgeInsets.symmetric(horizontal: screenHeight / 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight / 14,
                          ),
                          Image.asset(
                            'assets/images/name.png',
                            height: screenHeight / 11,
                          ),
                          SizedBox(
                            height: screenHeight / 20,
                          ),
                          const Text(
                            '''Please enter you new password ''',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: screenHeight / 34,
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            elevation: 1.5,
                            child: defaultTextField(
                                controller: passController,
                                lable: 'Password ',
                                prefix: Icons.lock_outline,
                                suffix: AppCubit.get(context).suffix,
                                suffixPressed: () {
                                  AppCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                isSecure: AppCubit.get(context).isPass,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Password can\'t be empty ';
                                  }
                                },
                                context: context,
                                type: TextInputType.visiblePassword),
                          ),
                          SizedBox(
                            height: screenHeight / 68,
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            elevation: 1.5,
                            child: defaultTextField(
                                controller: confirmPassController,
                                lable: 'Confirm password ',
                                prefix: Icons.lock_outline,
                                suffix: AppCubit.get(context).suffixx,
                                suffixPressed: () {
                                  AppCubit.get(context)
                                      .changePasswordVisibilityy();
                                },
                                isSecure: AppCubit.get(context).isPass,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Confirm password can\'t be empty ';
                                  }
                                },
                                context: context,
                                type: TextInputType.visiblePassword),
                          ),
                          SizedBox(
                            height: screenHeight / 35,
                          ),
                          ConditionalBuilder(
                            condition: state is! AppRestPasswordLoadingState,
                            builder: (context) => defaultButton(
                                height: screenHeight / 16,
                                onPress: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).resetPassword(
                                        email: email!,
                                        opt: code!,
                                        password: passController.text,
                                        confirmPassword:
                                            confirmPassController.text);
                                  } else {}
                                },
                                text: 'Confirm'),
                            fallback: (context) =>
                                const CircularProgressIndicator(),
                          ),
                          SizedBox(
                            height: screenHeight / 35,
                          ),
                          SizedBox(
                            height: screenHeight / 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 40,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 40,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight / 20,
                          ),
                          MaterialButton(
                            onPressed: () {
                              navigateAndFinish(context, LoginScreen());
                            },
                            hoverColor: primaryColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(27.0)),
                                side: BorderSide(color: primaryColor)),
                            color: Colors.white,
                            minWidth: double.infinity,
                            height: screenHeight / 16,
                            textColor: Colors.black,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/run.png',
                        width: double.infinity,
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
