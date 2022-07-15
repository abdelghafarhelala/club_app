import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Replay extends StatelessWidget {
  const Replay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
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
                  icon: const Icon(Icons.notifications_none_rounded))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    height: 90,
                    width: double.infinity,
                    color: HexColor("#101620"),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 100,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/free-photo/beautiful-vintage-collage-composition_23-2149479771.jpg?size=338&ext=jpg&uid=R24960600&ga=GA1.2.1634405249.1648830357',
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Topic Name - Created By : Amr Alsherif  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Center(child: Text("  H S ")),
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Haitham Shaker"),
                  ],
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/red.png"),
                        height: 20,
                      ),
                      Text(
                        "High",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Image(
                        image: AssetImage("assets/images/Ellipse 1278.png"),
                        height: 20,
                      ),
                      Text(
                        "Medium",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Image(
                        image: AssetImage("assets/images/green.png"),
                        height: 20,
                      ),
                      Text(
                        "Normal",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        // width: 80,

                        // color: Colors.black26,
                        decoration: BoxDecoration(
                          // color: Colors.grey,

                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Image(
                              image: AssetImage("assets/images/Path 11623.png"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'From Gallery',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        // width: 80,

                        // color: Colors.black26,
                        decoration: BoxDecoration(
                          // color: Colors.grey,

                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/Path 11624.png"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'From Camera',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment(-1, -1),
                  child: InkWell(
                    onTap: () {
                      // navigateTo(context,Replay() );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      color: Colors.grey,
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
