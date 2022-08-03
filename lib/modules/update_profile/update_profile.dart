import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/register/register.dart';
import 'package:club_app/network/local/cache_Helper.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

int? depid;
var emailController = TextEditingController();
var nameController = TextEditingController();
var jobTitleController = TextEditingController();
var phoneController = TextEditingController();
String Department = '';

var confirmPasswordController = TextEditingController();
// var formKeyUpdatePass = GlobalKey<FormState>();

var selectedValue;

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  GlobalKey<FormState> _productKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var profileData = AppCubit.get(context).profile?.data;

    emailController.text = profileData?.email ?? '';
    jobTitleController.text = profileData?.jobTitle ?? '';
    nameController.text = profileData?.name ?? '';
    phoneController.text = profileData?.mobileNumber ?? '';
    Department = profileData?.department ?? "";
    // selectedItem = profileData?.jobTitle ?? '';
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppUpdateUserDataSuccessState) {
          if (state.model?.success == true) {
            AppCubit.get(context).getUserData();
            showToast(
                text: state.model?.message ?? '', state: ToastStates.success);

            navigateAndFinish(context, HomeScreen());
            print(state.model?.user!.name);
          } else {
            showToast(text: state.model?.message, state: ToastStates.error);
          }
        } else if (state is AppUpdateUserDataErrorState) {
          showToast(text: 'This data is invalid', state: ToastStates.error);
        }
      },
      builder: (context, state) {
        double screenHeight = MediaQuery.of(context).size.height;

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
          body: ConditionalBuilder(
            condition: state is! AppGetUserDataLoadingState,
            fallback: (context) => Center(child: buildLoading()),
            builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
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
                  key: _productKey2,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenHeight / 35),
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight / 35,
                            ),
                            const Text(
                              'Profile Update',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 68,
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
                                  type: TextInputType.text),
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
                                  lable: 'E-mail',
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
                                height: screenHeight / 15,
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
                                            hint: Text(
                                              Department,
                                              // style: TextStyle(color: Colors.red),
                                            ),
                                            items: AppCubit.get(context)
                                                .departData
                                                .map<DropdownMenuItem<String>>(
                                                    (val) {
                                              return DropdownMenuItem(
                                                value: val.name,
                                                child: Text(
                                                  val.name!,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (val) {
                                              // setState(() {
                                              //   selectedItem = val;
                                              // });
                                              AppCubit.get(context)
                                                  .changeListVal(val);
                                            },
                                            value: AppCubit.get(context)
                                                .selectedItem,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // Expanded(
                                      //   child: Container(
                                      //     child: DropdownButton(
                                      //       iconSize: 30,
                                      //       autofocus: false,
                                      //       underline: Container(
                                      //         height: 0,
                                      //       ),
                                      //       onTap: () {},
                                      //       isExpanded: true,
                                      //       hint: const Text(
                                      //         'role',
                                      //         // style: TextStyle(color: Colors.red),
                                      //       ),
                                      //       items:
                                      //           listOfValue.map((String val) {
                                      //         return DropdownMenuItem(
                                      //           value: val,
                                      //           child: Text(
                                      //             val,
                                      //           ),
                                      //         );
                                      //       }).toList(),
                                      //       onChanged: (val) {
                                      //         // setState(() {
                                      //         //   selectedItem = val;
                                      //         // });
                                      //         AppCubit.get(context)
                                      //             .changeListVal(val);
                                      //       },
                                      //       value: AppCubit.get(context)
                                      //           .selectedItem,
                                      //     ),
                                      //   ),
                                      // ),
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
                              child: defaultTextFieldWithCustomIconImage(
                                  lable: 'Job Title',
                                  controller: jobTitleController,
                                  prefix: ImageIcon(
                                    AssetImage(
                                      "assets/images/job.png",
                                    ),
                                  ),
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Job Title can\'t be Empty  ';
                                    }
                                  },
                                  context: context,
                                  type: TextInputType.text),
                            ),
                            SizedBox(
                              height: screenHeight / 26,
                            ),
                            ConditionalBuilder(
                                condition:
                                    state is! AppUpdateUserDataLoadingState,
                                builder: (context) => defaultButton(
                                    height: screenHeight / 16,
                                    onPress: () {
                                      if (_productKey2.currentState!
                                          .validate()) {
                                        if (AppCubit.get(context)
                                                .selectedItem ==
                                            'HR') {
                                          depid = 1;
                                        } else if (AppCubit.get(context)
                                                .selectedItem ==
                                            'CEO') {
                                          depid = 2;
                                        } else if (AppCubit.get(context)
                                                .selectedItem ==
                                            'Employee') {
                                          depid = 3;
                                        } else if (AppCubit.get(context)
                                                .selectedItem ==
                                            'Legal') {
                                          depid = 4;
                                        }
                                        print(
                                            '#####################################################');
                                        print(phoneController.text);
                                        AppCubit.get(context).updateUserData(
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            name: nameController.text,
                                            jobTitle: jobTitleController.text,
                                            departmentId: depid ?? 1);
                                      } else {}
                                    },
                                    text: 'Update'),
                                fallback: (context) => buildLoading()),
                          ],
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
    );
  }
}
