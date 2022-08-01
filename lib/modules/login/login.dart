import 'package:club_app/modules/forget_password/forget_password.dart';
import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/loginCubit/loginCubit.dart';
import 'package:club_app/modules/login/loginCubit/loginStates.dart';
import 'package:club_app/modules/register/register.dart';
import 'package:club_app/modules/wait_manager/wait_manager.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

var phoneController = TextEditingController();
var passwordController = TextEditingController();
var formKeyLogin = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.model?.success == true) {
              CacheHelper.saveData(key: "token", value: state.model?.token)
                  .then((value) {
                token = state.model?.token;
                if (state.model!.user!.active == 'pending') {
                  navigateAndFinish(context, WaitManagerApproveScreen());
                } else {
                  AppCubit.get(context).getClubs();
                  navigateAndFinish(context, HomeScreen());
                  AppCubit.get(context).getUserData();
                  AppCubit.get(context).getgovernorates();
                  AppCubit.get(context).getCount();
                  AppCubit.get(context).getproject();
                  AppCubit.get(context).getDepartment();
                  AppCubit.get(context).getReMarkerData();
                  AppCubit.get(context).getNoteCategoryData();
                  AppCubit.get(context).getDepartment();
                  AppCubit.get(context).getLastClubs();
                }
                showToast(
                    text: 'Login successfully', state: ToastStates.success);
                // print(state.model?.data!.name);
              });
            } else {
              showToast(text: state.model?.message, state: ToastStates.error);
            }
          } else if (state is LoginErrorState) {
            showToast(
                text: 'The email or Password is invalid',
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
                  key: formKeyLogin,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight / 14),
                            Image.asset(
                              'assets/images/name.png',
                              height: screenHeight / 11,
                            ),
                            SizedBox(
                              height: screenHeight / 25,
                            ),
                            const Text(
                              'Login in your account',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),

                            // Text('تسجيل الدخول ',
                            //     style: Theme.of(context).textTheme.bodyText1),
                            SizedBox(
                              height: screenHeight / 37,
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
                                      return 'E-mail can\'t be empty ';
                                    }
                                  },
                                  context: context,
                                  type: TextInputType.emailAddress),
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
                                      return 'Password can\'t be empty ';
                                    }
                                  },
                                  context: context,
                                  type: TextInputType.visiblePassword),
                            ),
                            SizedBox(
                              height: screenHeight / 68,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      navigateTo(
                                          context, ForgetPasswordScreen());
                                    },
                                    child: Text(
                                      'Forget password ?',
                                      style: TextStyle(
                                        color: HexColor('#707070'),
                                        fontSize: 16,
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: screenHeight / 70,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => defaultButton(
                                  height: screenHeight / 14,
                                  onPress: () {
                                    if (formKeyLogin.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          phone: phoneController.text,
                                          password: passwordController.text,
                                          context: context);
                                    } else {}
                                  },
                                  text: 'Login'),
                              fallback: (context) =>
                                  Center(child: buildLoading()),
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   height: 50,
                            //   child: OutlinedButton(
                            //       onPressed: () {}, child: const Text('data')),
                            // ),
                            SizedBox(
                              height: screenHeight / 28,
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
                            SizedBox(height: screenHeight / 30),
                            MaterialButton(
                              onPressed: () {
                                navigateTo(context, RegisterScreen());
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
                                'Sign-up',
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
                          fit: BoxFit.fill,
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
      ),
    );
  }
}
