import 'package:club_app/modules/change_password/change_password_screen.dart';
import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/login.dart';
import 'package:club_app/modules/update_profile/update_profile.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppLogOutSuccessState) {
          showToast(text: 'LogOut Successfully', state: ToastStates.success);
          navigateAndFinish(context, LoginScreen());
        }
      },
      builder: (context, state) {
        var userData = AppCubit.get(context).profile;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            // For Android.
            // Use [light] for white status bar and [dark] for black status bar.
            statusBarIconBrightness: Brightness.light,
            statusBarColor: HexColor('#101620'),
            // For iOS.
            // Use [dark] for white status bar and [light] for black status bar.
            statusBarBrightness: Brightness.dark,
          ),
          child: Container(
            color: HexColor('#101620'),
            width: double.infinity,
            height: 111,
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userData?.user?.name ?? 'User Name',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 21),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userData?.user?.jobTitle ?? 'Job Title',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

//Build Drawer List
  Widget myDrawerList(context) {
    return Container(
      height: MediaQuery.of(context).size.height - 111,
      // padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(context, 'assets/images/projects.png', 'My Projects',
              HomeScreen()),
          menuItem(context, 'assets/images/pers.png', 'Update Profile',
              UpdateProfileScreen(),
              index: 1),
          if (AppCubit.get(context).profile?.user?.role == 'Super Admin')
            menuItem(
                context, 'assets/images/add.png', 'Add Project ', HomeScreen(),
                index: 3),
          if (AppCubit.get(context).profile?.user?.role == 'Super Admin')
            menuItem(
                context, 'assets/images/user.png', ' Add Users', HomeScreen(),
                index: 2),
          menuItem(context, 'assets/images/noti.png', ' Notifications',
              HomeScreen()),
          menuItem(context, 'assets/images/lang.png', 'Language ', HomeScreen(),
              index: 2),
          menuItem(context, 'assets/images/lock.png', 'Change password ',
              ChangePasswordScreen(),
              index: 2),
          Spacer(),
          if (token != null)
            menuItem2(
              context,
              Icons.logout,
              ' Log Out',
            ),
        ],
      ),
    );
  }

// Build menu of Drawer
  Widget menuItem(context, String icon, String text, Widget widget,
      {int index = 0}) {
    return Material(
      child: InkWell(
        onTap: () {
          if (text == 'Update Profile') {
            AppCubit.get(context).getUserData();
            AppCubit.get(context).currentIndex = index;
            navigateTo(context, widget);
          } else {
            navigateTo(context, widget);
            AppCubit.get(context).currentIndex = index;
          }
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              border: Border.all(color: HexColor('#707070').withOpacity(.3))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Image(
                  image: AssetImage(
                    icon,
                  ),
                  height: 30,
                )),
                // SizedBox(
                //   width: 10,
                // ),
                Expanded(
                    flex: 3,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Build menu2 of Drawer
  Widget menuItem2(
    context,
    IconData icon,
    String text,
  ) {
    return Material(
      child: InkWell(
        onTap: () {
          AppCubit.get(context).logOut(context);
        },
        child: Container(
          height: 59,
          decoration: BoxDecoration(
              color: HexColor('#F87F45').withOpacity(.1),
              border: Border.all(color: HexColor('#707070').withOpacity(.3))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                    child: Icon(
                  icon,
                  color: HexColor('#AF4040'),
                )),
                Expanded(
                    flex: 3,
                    child: Text(
                      text,
                      style: TextStyle(
                          color: HexColor('#AF4040'),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItem3(
    context,
    IconData icon,
    String text,
  ) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(child: Icon(icon)),
              Expanded(
                  flex: 3,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
              FlutterSwitch(
                inactiveColor: Colors.white,
                inactiveToggleColor: Colors.grey,
                activeColor: primaryColor,
                activeText: 'Dark',
                height: 25,
                width: 60,
                inactiveSwitchBorder: Border.all(color: Colors.black),
                activeTextColor: Colors.white,
                value: AppCubit.get(context).isDark,
                onToggle: (value) {
                  AppCubit.get(context).changeAppTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
