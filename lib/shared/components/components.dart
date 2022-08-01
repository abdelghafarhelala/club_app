import 'package:club_app/modules/drawer_unapproved/drawer_unapproved.dart';
import 'package:club_app/modules/myDrawer/myDrawer.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget defaultButton({
  double width = double.infinity,
  required double height,
  Color color = buttonColor,
  required Function onPress,
  required String text,
  double radius = 0.0,
  bool isUpper = false,
}) =>
    MaterialButton(
      color: primaryColor,
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27.0))),
      onPressed: () {
        onPress();
      },
      child: Text(
        isUpper ? text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
Widget defaultButton2({
  required double width,
  required double height,
  required Color color,
  required Function onPress,
  required String text,
  double radius = 0.0,
  bool isUpper = false,
}) =>
    MaterialButton(
      color: color,
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27.0))),
      onPressed: () {
        onPress();
      },
      child: Text(
        isUpper ? text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );

Widget defaultTextField({
  required String lable,
  required IconData prefix,
  Function? validate,
  required context,
  IconData? suffix,
  ImageIcon? imageIcon,
  Function? suffixPressed,
  bool isSecure = false,
  required TextInputType type,
  List<TextInputFormatter> formats = const [],
  required var controller,
  Function? ontap,
  // Function? onChange,
}) =>
    TextFormField(
      inputFormatters: formats,
      // style: Theme.of(context).textTheme.button,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
            icon: Icon(suffix),
            onPressed: () {
              suffixPressed!();
            }),
      ),
      keyboardType: type,
      obscureText: isSecure,
      validator: (String? s) {
        return validate!(s);
      },
      controller: controller,
      onTap: () {
        ontap!();
      },
      // onChanged: (String s){
      //     onChange!(s);
      // },
    );

Widget defaultTextFieldWithCustomIconImage({
  required String lable,
  required ImageIcon prefix,
  required Function? validate,
  required context,
  IconData? suffix,
  ImageIcon? imageIcon,
  Function? suffixPressed,
  bool isSecure = false,
  required TextInputType type,
  var controller,
  // Function? ontap,
  // Function? onChange,
}) =>
    TextFormField(
      // style: Theme.of(context).textTheme.button,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: prefix,
        prefixIconConstraints:
            BoxConstraints(maxHeight: 40, maxWidth: 50, minWidth: 50),
        suffixIcon: IconButton(
            icon: Icon(suffix),
            onPressed: () {
              suffixPressed!();
            }),
      ),
      keyboardType: type,
      obscureText: isSecure,
      validator: (String? s) {
        return validate!(s);
      },
      controller: controller,
      onTap: () {
        // ontap!();
      },
      // onChanged: (String s){
      //     onChange!(s);
      // },
    );

void showToast({@required String? text, @required ToastStates? state}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 7,
        backgroundColor: toastColor(state!),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { success, error, Warrnaing }

Color? color;
Color? toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      color = HexColor('#101620');
      break;
    case ToastStates.error:
      color = HexColor('#F02525');
      ;
      break;
    case ToastStates.Warrnaing:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget defaultDrawer(context) => Container(
      padding: EdgeInsets.all(0),
      width: 250,
      child: Drawer(
        child: Column(
          children: [
            const MyDrawer(),
            const MyDrawer().myDrawerList(context),
          ],
        ),
      ),
    );
Widget notDefaultDrawer(context) => Container(
      padding: EdgeInsets.all(0),
      width: 250,
      child: Drawer(
        child: Column(
          children: [
            const DrawerUnapproved(),
            const DrawerUnapproved().DrawerUnapprovedList(context),
          ],
        ),
      ),
    );

PreferredSizeWidget defaultAppBar(context, String title, isFirst) => AppBar(
      title: Text(title),
      actions: [
        if (!isFirst)
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward))
      ],
    );
buildIndicator(context) => showDialog(
      context: context,
      // barrierColor: _backgroundColor,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          // backgroundColor: _backgroundColor,
          content: Container(
            child: Center(
              child: Image.asset(
                'assets/images/ind.gif', // Put your gif into the assets folder
                width: 100,
              ),
            ),
          ),
        );
      },
    );

Widget buildLoading() => Container(
      // width: double.infinity,
      // height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Image(
            width: 80,
            image: AssetImage(
              'assets/images/ind.gif',
            )),
      ),
    );
