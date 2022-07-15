import 'package:club_app/models/clubModel/clubs.dart';
import 'package:club_app/modules/club_details/club_details.dart';
import 'package:club_app/network/remote/dio_helper.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:club_app/shared/const.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getClubs();
    AppCubit.get(context).getproject();
    AppCubit.get(context).getgovernorates();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var height = AppBar().preferredSize.height;
        final double screenHeight = MediaQuery.of(context).size.height;
        return Scaffold(
            key: scaffoldKey,
            drawer: defaultDrawer(context),
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () => scaffoldKey.currentState!.openDrawer(),
                  icon: const ImageIcon(
                    AssetImage('assets/images/Path 10008.png'),
                    size: 30,
                    color: Colors.black,
                  )),
              actions: const [
                Spacer(),
                Image(
                  image: AssetImage('assets/images/name.png'),
                  width: 150,
                ),
                Spacer(),
                Image(
                  height: 30,
                  image: AssetImage(
                    'assets/images/Icon ionic-md-notifications-outline.png',
                  ),
                ),
              ],
            ),
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
              child: ConditionalBuilder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: HexColor("#101620"),
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.polyline_rounded,
                                          color: Colors.white),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "${AppCubit.get(context).club!.data!.length} Project",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                color: HexColor("#101620"),
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: const [
                                      Image(
                                          image: AssetImage(
                                              "assets/images/Path 10225.png")),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "50 Member",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                // alignment:Alignment.bottomRight ,
                                autofocus: false, iconSize: 30,
                                isExpanded: true,
                                // menuMaxHeight: 100,
                                itemHeight: 50,

                                value: AppCubit.get(context).Drop_Down_Value,
                                // icon: const Icon(Icons.arrow_downward),
                                // elevation: 16,
                                hint:
                                    const Center(child: Text("Select Project")),

                                onChanged: (newValue) {
                                  AppCubit.get(context).set_drop(x: newValue);
                                },
                                items: AppCubit.get(context)
                                    .project!
                                    .data!
                                    .map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem<String>(
                                    value: e.name,
                                    child: Text("${e.name}"),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Image(
                                image: AssetImage(
                                    'assets/images/Icon feather-filter.png'))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 25,
                          child: Row(
                            children: const [
                              Image(
                                  image: AssetImage(
                                      'assets/images/Path 10227.png')),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Select targeted area",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // color: Colors.amber,
                          height: 40,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Gov(AppCubit.get(context)
                                  .governorate!
                                  .data![index]);
                            },
                            itemCount:
                                AppCubit.get(context).governorate!.data!.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 5,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 20,
                          child: Row(
                            children: const [
                              Image(
                                  image: AssetImage(
                                      'assets/images/Path 10228.png')),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Projects",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                "ViewAll",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: screenHeight - (height + 350),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return carrd(
                                  AppCubit.get(context).club!.data![index],
                                  context);
                            },
                            itemCount:
                                AppCubit.get(context).club?.data?.length == null
                                    ? 2
                                    : AppCubit.get(context).club!.data!.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container();
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 70,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Center(child: Text("  H S ")),
                                height: 120,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("City Club - Nasr City (Security)"),
                                  Row(
                                    children: const [
                                      Text("Mohammed El-Misiny"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.red,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                condition: AppCubit.get(context).club != null &&
                    AppCubit.get(context).governorate != null &&
                    AppCubit.get(context).project != null,
                fallback: (BuildContext context) {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ));
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Widget carrd(Data Model, context) {
    Color c;
    if (int.parse(Model.constructionRatio.toString().substring(0, 2)) <= 100 &&
        int.parse(Model.constructionRatio.toString().substring(0, 2)) >= 85) {
      c = Colors.green;
    } else if (int.parse(Model.constructionRatio.toString().substring(0, 2)) <=
            85 &&
        int.parse(Model.constructionRatio.toString().substring(0, 2)) >= 50) {
      c = Colors.orange;
    } else {
      c = Colors.red;
    }
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            ClubDetails(
              Model: Model,
            ));
      },
      child: Card(
        child: Container(
          height: 120,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                        "${Model.image}",
                      ),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(.7),
                      height: 35,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "${Model.city}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      )),
                      // width: double.infinity,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    " ${Model.city}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text("  Progress"),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          color: c,
                          child: Text(
                            "${Model.constructionRatio}",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Subscribers"),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                          color: Colors.grey,
                          child: Text(
                            "${Model.area!.substring(0, 2)}k",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Gov(model) => Container(
        height: 40,
        width: 80,

        // color: Colors.black26,
        decoration: BoxDecoration(
          // color: Colors.grey,

          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
            child: Text(
          '${model.nameEn}',
          style: TextStyle(color: Colors.black),
        )),
      );
}
