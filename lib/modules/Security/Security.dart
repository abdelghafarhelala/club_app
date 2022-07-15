import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Security extends StatelessWidget {
  // const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
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
                                'City club - Madinaty Cairo  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
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
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        // alignment:Alignment.bottomRight ,
                        autofocus: false, iconSize: 30,
                        isExpanded: true,

                        value: AppCubit.get(context).Dep_Value,
                        // icon: const Icon(Icons.arrow_downward),
                        // elevation: 16,
                        hint: Center(child: Text("Select Dept")),

                        onChanged: (newValue) {
                          AppCubit.get(context).set_Dep(x: newValue);
                        },
                        items: AppCubit.get(context)
                                    .department!
                                    .data!
                                    .map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem<String>(
                                    value: e.name,
                                    child: Text("${e.name}"),
                                  );
                                }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                        image:
                            AssetImage('assets/images/Icon feather-filter.png'))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Card(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image(
                                image: AssetImage("assets/images/10.PNG"),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Open",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Topic Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Dept : Security"),
                              Text("Created at : 20-06-2022"),
                              Text("Last Update : 23-06-2022 12:23"),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: Colors.grey,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/Path 10776.png"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "23Mem",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/Icon awesome-comments.png"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text("12 Com",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/Ellipse 1276.png"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text("Priority",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image(
                        image: AssetImage("assets/images/1.png"),
                        width: 20,
                        height: 20,
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Card(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image(
                                image: AssetImage("assets/images/10.PNG"),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Close",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Topic Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Dept : Security"),
                              Text("Created at : 20-06-2022"),
                              Text("Last Update : 23-06-2022 12:23"),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: Colors.grey,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/Path 10776.png"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "23Mem",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/Icon awesome-comments.png"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text("12 Com",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/Ellipse 1276.png"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text("Priority",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image(
                        image: AssetImage("assets/images/Icon feather-eye.png"),
                        width: 20,
                        height: 20,
                      ),
                    )
                  ],
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
