import 'package:club_app/modules/home/home_screen.dart';
import 'package:club_app/modules/login/login.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var userData = AppCubit.get(context).profile;
        return Container(
          color: HexColor('#101620'),
          width: double.infinity,
          height: 111,
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // userData?.data?.email ??
                'Omer Elshrif',
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                // userData?.data?.email ??
                'Job Title',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        );
      },
    );
  }

//Build Drawer List
  Widget myDrawerList(context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(context, 'assets/images/projects.png', 'My Projects',
              HomeScreen()),
          menuItem(context, 'assets/images/pers.png', 'Profile', HomeScreen(),
              index: 1),
          menuItem(
              context, 'assets/images/add.png', 'Add Project ', HomeScreen(),
              index: 3),
          menuItem(
              context, 'assets/images/user.png', ' Add Users', HomeScreen(),
              index: 2),
          menuItem(context, 'assets/images/noti.png', ' Notifications',
              const HomeScreen()),
          menuItem(context, 'assets/images/lang.png', 'Language ', HomeScreen(),
              index: 2),
          if (token == null)
            menuItem(context, 'assets/images/name.png', 'تسجيل الدخول',
                const LoginScreen()),
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
          navigateTo(context, widget);
          AppCubit.get(context).currentIndex = index;
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                  child: Image(
                image: AssetImage(
                  icon,
                ),
                height: 25,
              )),
              Expanded(
                  flex: 3,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            ],
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
          // AppCubit.get(context).logOut(context);
        },
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
            ],
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
