import 'dart:async';

import 'package:club_app/modules/login/login.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
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
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Image.asset(
                      'assets/images/name.png',
                      height: 67,
                    ),
                    const SizedBox(
                      height: 40,
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

                    const SizedBox(
                      height: 25,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.blue.shade50,
                      enableActiveFill: true,
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

                    const SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition: true,
                      builder: (context) => defaultButton(
                          onPress: () {
                            // if (formKey.currentState!.validate()) {
                            //   LoginCubit.get(context).userLogin(
                            //       phone: phoneController.text,
                            //       password: passwordController.text,
                            //       context: context);
                            // } else {}
                          },
                          text: 'Submit'),
                      fallback: (context) => const CircularProgressIndicator(),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 50,
                    //   child: OutlinedButton(
                    //       onPressed: () {}, child: const Text('data')),
                    // ),
                    const SizedBox(
                      height: 50,
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
                          borderRadius: BorderRadius.all(Radius.circular(27.0)),
                          side: BorderSide(color: primaryColor)),
                      color: Colors.white,
                      minWidth: double.infinity,
                      height: 50,
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
    );
  }
}
