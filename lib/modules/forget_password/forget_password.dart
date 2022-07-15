import 'package:club_app/modules/login/login.dart';
import 'package:club_app/modules/verification/verification.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var emailVerificationController = TextEditingController();
var formKey = GlobalKey<FormState>();

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSendEmailSuccessState) {
          if (state.model?.success == true) {
            showToast(text: state.model?.message, state: ToastStates.success);
            navigateTo(
                context,
                VerificationScreen(
                  email: emailVerificationController.text,
                ));
          } else {
            showToast(text: state.model?.message, state: ToastStates.error);
          }
        }
      },
      builder: (context, state) {
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
                          EdgeInsets.symmetric(horizontal: screenHeight / 35),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight / 14,
                          ),
                          Image.asset(
                            'assets/images/name.png',
                            height: 67,
                          ),
                          SizedBox(
                            height: screenHeight / 20,
                          ),
                          const Text(
                            '''Forget Password !
        Don\'t Worry ''',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(
                            height: screenHeight / 30,
                          ),
                          Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            elevation: 1.5,
                            child: defaultTextField(
                                lable: 'Please Enter your mail',
                                controller: emailVerificationController,
                                prefix: Icons.email_outlined,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'E-mail can\'t be empty ';
                                  }
                                },
                                context: context,
                                type: TextInputType.emailAddress),
                          ),

                          SizedBox(
                            height: screenHeight / 35,
                          ),
                          ConditionalBuilder(
                            condition: true,
                            builder: (context) => defaultButton(
                                height: screenHeight / 14,
                                onPress: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).sendEmail(
                                        email:
                                            emailVerificationController.text);
                                  } else {}
                                },
                                text: 'Submit'),
                            fallback: (context) =>
                                const CircularProgressIndicator(),
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   height: 50,
                          //   child: OutlinedButton(
                          //       onPressed: () {}, child: const Text('data')),
                          // ),
                          SizedBox(
                            height: screenHeight / 14,
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
                          SizedBox(height: screenHeight / 14),
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
                            height: screenHeight / 14,
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
