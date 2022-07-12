import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/loginCubit/loginCubit.dart';
import 'package:club_app/modules/login/loginCubit/loginStates.dart';
import 'package:club_app/modules/register/register.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.model?.success == true) {
              CacheHelper.saveData(key: "token", value: state.model?.token)
                  .then((value) {
                token = state.model?.token;
                navigateAndFinish(context, HomeScreen());
                AppCubit.get(context).getUserData();
                showToast(
                    text: 'تم تسجيل الدخول بنجاح', state: ToastStates.success);
                // print(state.model?.data!.name);
              });
            } else {
              showToast(text: state.model?.message, state: ToastStates.error);
            }
          }
        },
        builder: (context, state) {
          double screenHeight = MediaQuery.of(context).size.height;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                        Text(
                          'Login in your account',
                          style: TextStyle(fontSize: 24),
                        ),

                        // Text('تسجيل الدخول ',
                        //     style: Theme.of(context).textTheme.bodyText1),
                        const SizedBox(
                          height: 25,
                        ),
                        Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 1.5,
                          child: defaultTextField(
                              lable: 'E-mail or Mobile',
                              controller: phoneController,
                              prefix: Icons.email_outlined,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'يجب ان تدخل رقم الهاتف';
                                }
                              },
                              context: context,
                              type: TextInputType.emailAddress),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 1.5,
                          child: defaultTextField(
                              controller: passwordController,
                              lable: 'Password ',
                              prefix: Icons.lock_outline,
                              suffix: LoginCubit.get(context).suffix,
                              suffixPressed: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              isSecure: LoginCubit.get(context).isPass,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'يجب ان تدخل كلمه السر';
                                }
                              },
                              context: context,
                              type: TextInputType.visiblePassword),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                      context: context);
                                } else {}
                              },
                              text: 'Login'),
                          fallback: (context) =>
                              const CircularProgressIndicator(),
                        ),
                        // Container(
                        //   width: double.infinity,
                        //   height: 50,
                        //   child: OutlinedButton(
                        //       onPressed: () {}, child: const Text('data')),
                        // ),
                        const SizedBox(
                          height: 40,
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
                          height: 40,
                        ),
                        MaterialButton(
                          onPressed: () {},
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
                            'Sign-up',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/images/run.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
