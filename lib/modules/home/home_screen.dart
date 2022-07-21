import 'package:club_app/models/clubModel/clubs.dart';
import 'package:club_app/models/projectModel/project.dart';
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

bool h = true;
Color colorCity = Colors.white;

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var height = AppBar().preferredSize.height;
        final double screenHeight = MediaQuery.of(context).size.height;
        return ConditionalBuilder(
          condition: state is! AppGetdepartmentsLoadingState,
          fallback: (context) => Center(child: CircularProgressIndicator()),
          builder: (context) => Scaffold(
              resizeToAvoidBottomInset: false,
              key: scaffoldKey,
              drawer: defaultDrawer(context),
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () => scaffoldKey.currentState!.openDrawer(),
                    icon: const ImageIcon(
                      AssetImage('assets/images/Path 10008.png'),
                      size: 30,
                      color: Colors.black,
                    )),
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
                      padding: EdgeInsets.symmetric(vertical: 15),
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
                                        Icon(
                                          Icons.polyline_rounded,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${AppCubit.get(context).Count?.projects ?? ''} Project ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              Expanded(
                                child: Container(
                                  color: HexColor("#101620"),
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/images/Path 10225.png"),
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${AppCubit.get(context).Count?.members ?? ''} Member",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: ConditionalBuilder(
                                        condition: AppCubit.get(context)
                                                .project!
                                                .projectData!
                                                .length >
                                            0,
                                        fallback: (context) => Center(
                                            child: CircularProgressIndicator()),
                                        builder: (context) =>
                                            DropdownButton<String>(
                                          alignment: Alignment.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: HexColor('#101620'),
                                          ),
                                          autofocus: false, iconSize: 30,
                                          isExpanded: true,
                                          // menuMaxHeight: 100,
                                          itemHeight: 50,
                                          underline: Container(
                                            height: 0,
                                          ),

                                          value: AppCubit.get(context)
                                              .Drop_Down_Value,
                                          // icon: const Icon(Icons.arrow_downward),
                                          // elevation: 16,
                                          hint: const Center(
                                              child: Text("Select Project")),

                                          onChanged: (newValue) {
                                            AppCubit.get(context)
                                                .set_drop(x: newValue);
                                          },
                                          items: AppCubit.get(context)
                                              .project!
                                              .projectData!
                                              .map<DropdownMenuItem<String>>(
                                                  (e) {
                                            return DropdownMenuItem<String>(
                                              value: e.name,
                                              child: Text("${e.name}"),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Image(
                                  width: 30,
                                  image: AssetImage(
                                      'assets/images/Icon feather-filter.png'),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 25,
                              child: Row(
                                children: const [
                                  ImageIcon(AssetImage(
                                      'assets/images/Path 10227.png')),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Select targeted area",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ConditionalBuilder(
                              condition: AppCubit.get(context)
                                          .governorate
                                          ?.data
                                          ?.length !=
                                      null &&
                                  AppCubit.get(context)
                                          .governorate!
                                          .data!
                                          .length >
                                      0,
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                              builder: (context) => Container(
                                // color: Colors.amber,
                                height: 40,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Gov(
                                        AppCubit.get(context)
                                            .governorate!
                                            .data![index],
                                        index,
                                        context);
                                  },
                                  itemCount: AppCubit.get(context)
                                      .governorate!
                                      .data!
                                      .length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 5,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
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
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ConditionalBuilder(
                              condition:
                                  AppCubit.get(context).club!.data!.length >
                                          0 &&
                                      AppCubit.get(context)
                                              .project!
                                              .projectData!
                                              .length >
                                          0,
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                              builder: (context) => Container(
                                height: screenHeight - (height + 370),
                                width: double.infinity,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return carrd(
                                        AppCubit.get(context)
                                            .club!
                                            .data![index],
                                        AppCubit.get(context)
                                            .project!
                                            .projectData![0],
                                        context);
                                  },
                                  itemCount:
                                      AppCubit.get(context).club!.data!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 0,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 45,
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
                                  child: Center(
                                      child: Text(
                                    "  H S ",
                                    style: TextStyle(fontSize: 20),
                                  )),
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
                                    Text(
                                      "City Club - Nasr City (Security)",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Mohammed El-Misiny",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        CircleAvatar(
                                          radius: 7,
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
                  // AppCubit.get(context).Count != null,
                  fallback: (BuildContext context) {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              )),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Widget carrd(Data Model, ProjectData project, context) {
    Color c;
    if (int.parse(Model.constructionRatio.toString().substring(0, 2)) <= 100 &&
        int.parse(Model.constructionRatio.toString().substring(0, 2)) >= 75) {
      c = HexColor('#38C117');
    } else if (int.parse(Model.constructionRatio.toString().substring(0, 2)) <=
            75 &&
        int.parse(Model.constructionRatio.toString().substring(0, 2)) >= 50) {
      c = HexColor('#F09A25');
    } else {
      c = HexColor('#F02525');
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
          padding: EdgeInsets.all(0),
          height: 130,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: 130,
                width: 120,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: Container(
                        // padding: EdgeInsets.only(bottom: 40),
                        child: Image(
                          image: NetworkImage(
                            project.logo ??
                                'https://estadat.ivas.com.eg/uploads/projects/l8QABPuCRmkeDEdAoZYHIk99lEgl0WjvmhtxRIK8.png',
                          ),
                          width: 93,
                          height: 38,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      color: HexColor('#6F6F6F'),
                      height: 28,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "${Model.city}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      // width: double.infinity,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.blue,
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 160,
                            child: Row(
                              children: [
                                Container(
                                  // width: MediaQuery.of(context).size.width - 160,
                                  child: Expanded(
                                    child: Text(
                                      " ${Model.name} ",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 25),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.zero,
                        // color: Colors.amber,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width - 160,
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Progress",
                                      style: TextStyle(fontSize: 20),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      color: c,
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          "${Model.constructionRatio}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Expanded(
                                    child: Text(
                                      "Subscribers",
                                      style: TextStyle(fontSize: 20),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                      color: Colors.grey,
                                      height: 30,
                                      padding: EdgeInsets.all(2),
                                      child: Center(
                                        child: Text(
                                          "${Model.area!.substring(0, 2)}k",
                                          style: const TextStyle(
                                              color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Gov(model, index, context) => Row(
        children: [
          if (index == 0)
            InkWell(
              onTap: () {
                AppCubit.get(context).changeCityColor(40);
              },
              child: Container(
                  height: 44,
                  width: 100,
                  // color: Colors.black26,
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).cityIndex == 40
                        ? AppCubit.get(context).cityColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    'all',
                    style: TextStyle(
                        color: HexColor('#101620'),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ))),
            ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              AppCubit.get(context).changeCityColor(index);
            },
            child: Container(
              height: 44,
              width: 100,

              // color: Colors.black26,
              decoration: BoxDecoration(
                color: index == AppCubit.get(context).cityIndex
                    ? AppCubit.get(context).cityColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Center(
                  child: Text(
                '${model.nameEn}',
                style: TextStyle(
                    color: HexColor('#101620'),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
            ),
          ),
        ],
      );
}
