import 'package:cached_network_image/cached_network_image.dart';
import 'package:club_app/models/remarker/remarker_model.dart';
import 'package:club_app/models/userModel/userModel.dart';
import 'package:club_app/modules/full_screen_image/full_screen_image.dart';
import 'package:club_app/modules/replay/replay.dart';
import 'package:club_app/modules/vedio/vedio.dart';
import 'package:club_app/network/endpoints.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

String ay = '';

final f = new DateFormat('dd/MM/yyyy HH:mm');
var decController = TextEditingController();

class Remarker extends StatelessWidget {
  final int club_id;
  final int noteCategory_id;
  const Remarker(
      {Key? key, required this.club_id, required this.noteCategory_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    AppCubit.get(context).remarkerModel!.data![0].createdAt!.split('T');
    print(AppCubit.get(context).profile?.user?.name);
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
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
                  size: 25,
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
                  icon: const Icon(Icons.notifications_none_rounded),
                  color: Colors.black,
                  iconSize: 30,
                )
              ],
            ),
            body: Column(
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
                            width: 5,
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Topic Name  \n Created By : Amr Alsherif  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Container(
                  height: screenHeight - 230,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return buildRemarkerItem(
                          context,
                          AppCubit.get(context).remarkerModel?.data?[index],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 1,
                          ),
                      itemCount:
                          AppCubit.get(context).remarkerModel!.data!.length),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      navigateTo(
                          context,
                          Replay(
                            clubId: club_id,
                            NoteCategoryId: noteCategory_id,
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      color: Colors.grey,
                      child: Center(
                          child: Text(
                        "Add Reply",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ],
            ));
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

Widget buildRemarkerItem(context, Data? remarkerData) {
  Widget buildDialog(
    context,
  ) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(.001),
      insetPadding: EdgeInsets.all(20),
      insetAnimationCurve: Curves.linearToEaseOut,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        // padding: EdgeInsets.all(20),
        height: 400,
        width: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // color: Colors.black.withOpacity(.0),
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),

              height: 30,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: ImageIcon(
                    AssetImage('assets/images/Path 11627.png'),
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              height: 260,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(remarkerData
                              ?.listGallery?[AppCubit.get(context).index]
                              .file ??
                          ''),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (AppCubit.get(context).index > 0) {
                        if (remarkerData!
                                .listGallery?[AppCubit.get(context).index - 1]
                                .fileType ==
                            'Video') {
                          print(
                              '************************************************88');
                          print(AppCubit.get(context).index);
                          AppCubit.get(context).count2Index();
                          AppCubit.get(context).count2Index();
                        } else {
                          AppCubit.get(context).count2Index();
                        }
                      }
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: () {
                      if (AppCubit.get(context).index == 0 ||
                          AppCubit.get(context).index <
                              remarkerData!.listGallery!.length - 1) {
                        if (remarkerData!
                                .listGallery?[AppCubit.get(context).index + 1]
                                .fileType ==
                            'Video') {
                          AppCubit.get(context).countIndex();
                          AppCubit.get(context).countIndex();
                        } else {
                          AppCubit.get(context).countIndex();
                        }
                      }
                    },
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  return InkWell(
    onTap: () {
      // print(remarkerData?.filePath);
    },
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            // crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                child: Center(
                    child: Text(
                  remarkerData?.employee?[0] ?? ''.toUpperCase(),
                  style: TextStyle(fontSize: 30),
                )),
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    remarkerData?.employee ?? '',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${DateTime.parse(remarkerData!.createdAt!).day.toString()}-${DateTime.parse(remarkerData.createdAt!).month.toString()}-${DateTime.parse(remarkerData.createdAt!).year.toString()} ${DateTime.parse(remarkerData.createdAt!).hour.toString()}:${DateTime.parse(remarkerData.createdAt!).second.toString()} ',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              const Spacer(),
              if (remarkerData.listGallery!.length == 1)
                if (remarkerData.listGallery!.isNotEmpty &&
                    remarkerData.listGallery?[0].fileType == 'Video')
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(
                              context,
                              VideoPlayerScreen(
                                url: remarkerData.listGallery?[0].file ?? '',
                              ));
                        },
                        child: const Image(
                          height: 20,
                          image: AssetImage(
                              "assets/images/Icon feather-video.png"),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 25,
                        color: Colors.grey,
                      ),
                    ],
                  ),
              if (remarkerData.listGallery!.length > 1 &&
                  remarkerData.listGallery!.length > 2 &&
                  remarkerData.listGallery!.length < 4)
                if ((remarkerData.listGallery!.isNotEmpty &&
                        remarkerData.listGallery?[0].fileType == 'Video') ||
                    remarkerData.listGallery?[1].fileType == 'Video' ||
                    remarkerData.listGallery?[2].fileType == 'Video')
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          remarkerData.listGallery!.forEach((element) {
                            if (element.fileType == 'Video') {
                              navigateTo(
                                  context,
                                  VideoPlayerScreen(
                                    url: element.file ?? '',
                                  ));
                            }
                          });
                        },
                        child: const Image(
                            height: 20,
                            image: AssetImage(
                                "assets/images/Icon feather-video.png")),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 1,
                        height: 25,
                        color: Colors.grey,
                      ),
                    ],
                  ),
              const SizedBox(
                width: 5,
              ),
              if (remarkerData.listGallery!.isNotEmpty &&
                  remarkerData.listGallery?[0].fileType == 'Image')
                InkWell(
                  onTap: () {
                    AppCubit.get(context).index = 0;
                    showDialog(
                      context: context,
                      builder: (context) => buildDialog(context),
                    );
                    // navigateTo(
                    //     context,
                    //     FullScreenImageScreen(
                    //         imagePath: remarkerData.filePath ?? ''));

                    // Navigator.of(context).push(
                    //   PageRouteBuilder(
                    //     opaque: true,
                    //     barrierDismissible: false,
                    //     pageBuilder: (BuildContext context, _, __) {
                    //       return Scaffold(
                    //         body: SafeArea(
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: <Widget>[
                    //               Align(
                    //                 alignment: Alignment.topRight,
                    //                 child: IconButton(
                    //                     onPressed: () =>
                    //                         Navigator.of(context).pop(),
                    //                     icon: const Icon(Icons.cancel_sharp)),
                    //               ),
                    //               Expanded(
                    //                 child: InteractiveViewer(
                    //                   scaleEnabled: true,
                    //                   panEnabled: true,
                    //                   child: Hero(
                    //                     tag: remarkerData
                    //                       ..listGallery?[0].file!,
                    //                     child: Center(
                    //                         child: Image(
                    //                             image: NetworkImage(
                    //                                 remarkerData
                    //                                     .listGallery![0]
                    //                                     .file!))),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                  child: const Image(
                      height: 30,
                      image:
                          AssetImage("assets/images/Icon feather-image.png")),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            borderOnForeground: true,
            // shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: double.infinity,
              height: 110,
              child: Column(
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(width: 1, color: Colors.grey[300]!)),
                    child: TextFormField(
                      maxLines: 3,
                      controller:
                          TextEditingController(text: remarkerData.desc),
                      enabled: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(8)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
