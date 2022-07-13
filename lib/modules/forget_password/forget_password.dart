import 'package:club_app/modules/login/login.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

var emailVerificationController = TextEditingController();
var formKey = GlobalKey<FormState>();

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
