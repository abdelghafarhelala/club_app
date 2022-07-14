import 'package:club_app/modules/myDrawer/myDrawer.dart';
import 'package:club_app/shared/colors.dart';
import 'package:club_app/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  double height = 50,
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

Widget defaultTextField({
  required String lable,
  required IconData prefix,
  required Function? validate,
  required context,
  IconData? suffix,
  Function? suffixPressed,
  bool isSecure = false,
  required TextInputType type,
  var controller,
  // Function? ontap,
  // Function? onChange,
}) =>
    TextFormField(
      style: Theme.of(context).textTheme.button,
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
        fontSize: 17.0);

enum ToastStates { success, error, Warrnaing }

Color? color;
Color? toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.Warrnaing:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget defaultDrawer(context) => Container(
      padding: EdgeInsets.all(0),
      width: 243,
      child: Drawer(
        child: Column(
          children: [
            const MyDrawer(),
            const MyDrawer().myDrawerList(context),
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
