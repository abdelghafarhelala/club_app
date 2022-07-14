import 'package:club_app/modules/login/login.dart';
import 'package:club_app/modules/login/loginCubit/loginCubit.dart';
import 'package:club_app/modules/login/loginCubit/loginStates.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

var formKey = GlobalKey<FormState>();
var passController = TextEditingController();
var confirmPassController = TextEditingController();

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
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
                          '''Please enter you new password ''',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 25,
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
                        const SizedBox(
                          height: 10,
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
                              text: 'Confirm'),
                          fallback: (context) =>
                              const CircularProgressIndicator(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
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
      },
    );
  }
}
