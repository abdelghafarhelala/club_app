import 'dart:async';

import 'package:club_app/modules/login/login.dart';
import 'package:club_app/modules/reset_password/reset_password.dart';
import 'package:club_app/network/endpoints.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

String currentText = "";

var emailVerificationController1 = TextEditingController();
var emailVerificationController2 = TextEditingController();
var emailVerificationController3 = TextEditingController();
var emailVerificationController5 = TextEditingController();
StreamController<ErrorAnimationType> errorController =
    StreamController<ErrorAnimationType>();
var formKey = GlobalKey<FormState>();

class VerificationScreen extends StatefulWidget {
  final String? email;
  const VerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerificationScreen> createState() =>
      _VerificationScreenState(this.email);
}

class _VerificationScreenState extends State<VerificationScreen> {
  final String? email;

  _VerificationScreenState(this.email);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppSendOptSuccessState) {
        if (state.model?.success == true) {
          showToast(text: state.model?.message, state: ToastStates.success);
          navigateTo(
              context,
              ResetPassword(
                code: emailVerificationController1.text,
                email: email,
              ));
        } else {
          showToast(text: state.model?.message, state: ToastStates.error);
        }
      }
    }, builder: (context, state) {
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
                        EdgeInsets.symmetric(horizontal: screenHeight / 33),
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
                          height: screenHeight / 18,
                        ),
                        const Text(
                          '''Please enter OTP 
        received on your mail ''',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: screenHeight / 35,
                        ),
                        PinCodeTextField(
                          cursorColor: Colors.white,
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 60,
                            activeFillColor: Colors.white,
                            inactiveColor: Colors.grey[200],
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: false,
                          errorAnimationController: errorController,
                          controller: emailVerificationController1,
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                        SizedBox(
                          height: screenHeight / 35,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          builder: (context) => defaultButton(
                              height: screenHeight / 16,
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  print(emailVerificationController1.text);
                                  print(email);
                                  AppCubit.get(context).sendOpt(
                                      email: email!,
                                      opt: emailVerificationController1.text);
                                } else {}
                              },
                              text: 'Confirm'),
                          fallback: (context) =>
                              const CircularProgressIndicator(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Not Received!',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w300),
                            ),
                            TextButton(
                                onPressed: () {
                                  AppCubit.get(context)
                                      .sendEmail(email: email!);
                                },
                                child: Text('Send Again',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w300,
                                        color: HexColor('#648FE3'))))
                          ],
                        ),
                        SizedBox(
                          height: screenHeight / 35,
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
                        const SizedBox(
                          height: 50,
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
    });
  }
}
