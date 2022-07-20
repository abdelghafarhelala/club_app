import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/login.dart';
import 'package:club_app/modules/register/registerCubit/registerCubit.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'registerCubit/registerStates.dart';

var selectedItem;
var selectedItem2;
int? depid;
var emailController = TextEditingController();
var nameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var confirmPasswordController = TextEditingController();
var formKey = GlobalKey<FormState>();

var selectedValue;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> listOfValue = ['HR', 'CEO', 'Employee', 'Legal'];
    List<String> listOfValue2 = ['Super Admin', 'Manager', 'Employee'];
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.model?.success == true) {
              CacheHelper.saveData(key: "token", value: state.model?.token)
                  .then((value) {
                token = state.model?.token;
                AppCubit.get(context).getUserData();
                showToast(
                    text: 'Register successfully', state: ToastStates.success);
                navigateAndFinish(context, LoginScreen());
                print(state.model?.user!.name);
              });
            } else {
              showToast(text: state.model?.message, state: ToastStates.error);
            }
          } else if (state is RegisterErrorState) {
            showToast(text: 'This data is invalid', state: ToastStates.error);
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
                            EdgeInsets.symmetric(horizontal: screenHeight / 34),
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
                              'You are one of our team',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
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
                                  lable: 'Name',
                                  controller: nameController,
                                  prefix: Icons.person_outline,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Name can\'t be empty ';
                                    }
                                  },
                                  context: context,
                                  type: TextInputType.emailAddress),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Card(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              elevation: 1.5,
                              child: defaultTextField(
                                  formats: [
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  lable: 'Mobile Number',
                                  controller: phoneController,
                                  prefix: Icons.phone_iphone,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Mobile Number can\'t be empty ';
                                    }
                                  },
                                  context: context,
                                  type: TextInputType.phone),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Card(
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              elevation: 1.5,
                              child: defaultTextField(
                                  lable: 'E-mail or Mobile',
                                  controller: emailController,
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
                              height: 5,
                            ),
                            Card(
                              elevation: 1.5,
                              child: Container(
                                width: double.infinity,
                                height: screenHeight / 16,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.format_list_bulleted_rounded,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: DropdownButton(
                                            iconSize: 30,
                                            autofocus: false,
                                            underline: Container(
                                              height: 0,
                                            ),
                                            onTap: () {},
                                            isExpanded: true,
                                            hint: const Text(
                                              'Dept',
                                              // style: TextStyle(color: Colors.red),
                                            ),
                                            items:
                                                listOfValue.map((String val) {
                                              return DropdownMenuItem(
                                                value: val,
                                                child: Text(
                                                  val,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedItem = val;
                                              });
                                            },
                                            value: selectedItem,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Card(
                              elevation: 1.5,
                              child: Container(
                                width: double.infinity,
                                height: screenHeight / 16,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      const ImageIcon(
                                        AssetImage("assets/images/job.png"),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: DropdownButton(
                                            iconSize: 30,
                                            autofocus: false,
                                            underline: Container(
                                              height: 0,
                                            ),
                                            onTap: () {},
                                            isExpanded: true,
                                            hint: const Text(
                                              'Job Title',
                                              // style: TextStyle(color: Colors.red),
                                            ),
                                            items:
                                                listOfValue2.map((String val) {
                                              return DropdownMenuItem(
                                                value: val,
                                                child: Text(
                                                  val,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedItem2 = val;
                                              });
                                            },
                                            value: selectedItem2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
                                  suffix: RegisterCubit.get(context).suffix,
                                  suffixPressed: () {
                                    RegisterCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                  isSecure: RegisterCubit.get(context).isPass,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Password can\'t be empty ';
                                    }
                                  },
                                  context: context,
                                  type: TextInputType.visiblePassword),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context) => defaultButton(
                                  height: screenHeight / 16,
                                  onPress: () {
                                    if (formKey.currentState!.validate()) {
                                      if (selectedItem == 'HR') {
                                        depid = 1;
                                      } else if (selectedItem == 'CEO') {
                                        depid = 2;
                                      } else if (selectedItem == 'Employee') {
                                        depid = 3;
                                      } else if (selectedItem == 'Legal') {
                                        depid = 4;
                                      }
                                      RegisterCubit.get(context).userRegister(
                                          email: emailController.text,
                                          phone: phoneController.text,
                                          name: nameController.text,
                                          password: passwordController.text,
                                          jobTitle: selectedItem2,
                                          departmentId: depid!);
                                    } else {}
                                  },
                                  text: 'Register'),
                              fallback: (context) =>
                                  const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/run.png',
                          fit: BoxFit.fill,
                          // fit: BoxFit.fi,
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
