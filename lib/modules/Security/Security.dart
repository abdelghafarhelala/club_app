import 'package:club_app/models/remarker/remarker_model.dart';
import 'package:club_app/modules/remarker/remarker.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Security extends StatelessWidget {
  String city;
  final int club_id;
  //  Security({Key? key}) : super(key: key);
  Security({required this.city, required this.club_id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var screenWidth = MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
          body: SingleChildScrollView(
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
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
                                  image: AssetImage(
                                    'assets/images/est.jpg',
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                ' ${city} ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Card(
                          elevation: 2,
                          child: DropdownButton<String>(
                            // alignment:Alignment.bottomRight ,
                            autofocus: false, iconSize: 30,

                            isExpanded: true,
                            underline: Container(height: 0),
                            value: AppCubit.get(context).Dep_Value,
                            // icon: const Icon(Icons.arrow_downward),
                            // elevation: 16,
                            hint: Center(child: Text("Select Dept")),

                            onChanged: (newValue) {
                              AppCubit.get(context).set_Dep(x: newValue);
                              AppCubit.get(context).getCategoryList(
                                  AppCubit.get(context).remarkerModel!.data!);
                            },
                            items: AppCubit.get(context)
                                .noteCategoryModel!
                                .data!
                                .map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem<String>(
                                value: e.name,
                                child: Center(
                                    child: Text("${e.name}",
                                        textAlign: TextAlign.center)),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Image(
                      //     image: AssetImage(
                      //         'assets/images/Icon feather-filter.png'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                if (AppCubit.get(context).filter.length > 0 ||
                    AppCubit.get(context).isFilterd == false)
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => AppCubit.get(context)
                              .isFilterd
                          ? buildSecurityItem(
                              context,
                              AppCubit.get(context).filter[index],
                              screenWidth,
                              club_id)
                          : buildSecurityItem(
                              context,
                              AppCubit.get(context).remarkerModel!.data![index],
                              screenWidth,
                              club_id),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 0,
                          ),
                      itemCount:
                          AppCubit.get(context).remarkerModel!.data!.length),
                if (AppCubit.get(context).filter.length == 0 &&
                    AppCubit.get(context).isFilterd == true)
                  Center(
                    child: Text(
                      'There is No items here',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800),
                    ),
                  )
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

Widget buildSecurityItem(context, Data model, screenWidth, int club_id) =>
    InkWell(
      onTap: () {
        int? cat_id;
        AppCubit.get(context).noteCategoryModel?.data?.forEach((element) {
          if (element.name == model.noteCategory) {
            cat_id = element.id;
            navigateTo(
                context,
                Remarker(
                  club_id: club_id,
                  noteCategory_id: cat_id!,
                ));
          }
        });

        model.seen = AppCubit.get(context).changeEye(model.seen!);
        AppCubit.get(context).getSingeReMarkerData(id: model.id!);
        print('**************************************');
        print(AppCubit.get(context).c);
        print(model.seen);
        // print(AppCubit.get(context)
        //     .getCategoryList(AppCubit.get(context).remarkerModel!.data!)[0]
        //     .desc);
      },
      child: Container(
        height: 150,
        child: Stack(
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
                      if (model.listGallery!.isNotEmpty &&
                          model.listGallery?[0].fileType == 'Image')
                        Image(
                          image: NetworkImage(model.listGallery?[0].file ??
                              'https://t4.ftcdn.net/jpg/02/51/95/53/240_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg'),
                          width: screenWidth / 3.5,
                          height: 100,
                        ),
                      if (model.listGallery!.isNotEmpty &&
                          model.listGallery?[0].file == 'Video')
                        Image(
                          image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/02/51/95/53/240_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg'),
                          width: screenWidth / 3.5,
                          height: 100,
                        ),
                      // if (model.listGallery?[0].file == '')
                      //   Image(
                      //     image: NetworkImage(
                      //         'https://t4.ftcdn.net/jpg/02/51/95/53/240_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg'),
                      //     width: 100,
                      //     height: 100,
                      //   ),
                      if (model.listGallery!.isEmpty)
                        Image(
                          image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/02/51/95/53/240_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg'),
                          width: screenWidth / 3.5,
                          height: 100,
                        ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          print(model..listGallery?[0].fileType);
                          print(model.listGallery![0].file);
                        },
                        child: Text(
                          model.noteStatus ?? '',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        model.club ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dept : ${model.noteCategory}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        "Created at : ${model.createdAt?.substring(0, 16).replaceRange(10, 11, ' ') ?? ''}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        "Last Update : ${model.updatedAt?.substring(0, 16).replaceRange(10, 11, ' ') ?? ''}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      Spacer(),
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: screenWidth / 4.48,
                                padding: EdgeInsets.all(3),
                                color: HexColor('#6F6F6F'),
                                height: 30,
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        "assets/images/Path 10776.png",
                                      ),
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "${model.count?.members} Member",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: screenWidth / 4.15,
                            padding: EdgeInsets.all(3),
                            color: HexColor('#6F6F6F'),
                            height: 30,
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                    "assets/images/Icon awesome-comments.png",
                                  ),
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "${model.count?.members} Comment",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: screenWidth / 5.805,
                            padding: EdgeInsets.all(3),
                            color: HexColor('#6F6F6F'),
                            height: 30,
                            child: Row(
                              children: [
                                if (model.priority == 'Low')
                                  Image(
                                    height: 12,
                                    image: AssetImage(
                                      "assets/images/green.png",
                                    ),
                                  ),
                                if (model.priority == 'Medium')
                                  Image(
                                    height: 12,
                                    image: AssetImage(
                                      "assets/images/Ellipse 1278.png",
                                    ),
                                  ),
                                if (model.priority == 'High')
                                  Image(
                                    height: 12,
                                    image: AssetImage(
                                      "assets/images/red.png",
                                    ),
                                  ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  " Priority",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
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
              child: Column(
                children: [
                  if (model.seen == 0)
                    Image(
                      image: AssetImage("assets/images/Icon feather-eyes.png"),
                      width: 20,
                      height: 20,
                    ),
                  if (model.seen == 1)
                    Image(
                      image: AssetImage("assets/images/Icon feather-eye.png"),
                      width: 20,
                      height: 20,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
