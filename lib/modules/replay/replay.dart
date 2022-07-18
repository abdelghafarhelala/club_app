import 'package:club_app/models/projectModel/project.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

int clicked = 3;

class Replay extends StatelessWidget {
  final ProjectData? projects;
  const Replay({Key? key, this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var replyController = TextEditingController();
        late var postImage = AppCubit.get(context).postImage;
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                          Center(
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(12),
                              width: 118,
                              height: 61,
                              // padding: EdgeInsets.only(bottom: 40),
                              child: Container(
                                child: Image(
                                  image: NetworkImage(
                                    // project.logo ??
                                    'https://estadat.ivas.com.eg/uploads/projects/l8QABPuCRmkeDEdAoZYHIk99lEgl0WjvmhtxRIK8.png',
                                  ),
                                  width: 50,
                                  height: 38,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
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
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: TextFormField(
                    controller: replyController,
                    decoration: InputDecoration(
                      hintText: 'Write your reply',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    maxLines: 7,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          clicked = 3;
                          AppCubit.get(context)
                              .clickPriority(click: clicked, num: 3);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/images/red.png"),
                                  height: 20,
                                ),
                                Text(
                                  "High",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            if (clicked == 3)
                              Container(
                                height: 3,
                                color: Colors.red,
                                width: 70,
                              )
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          clicked = 2;
                          AppCubit.get(context)
                              .clickPriority(click: clicked, num: 2);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/Ellipse 1278.png"),
                                  height: 20,
                                ),
                                Text(
                                  "Medium",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            if (clicked == 2)
                              Container(
                                height: 3,
                                color: HexColor('#F09A25'),
                                width: 75,
                              )
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          clicked = 1;
                          AppCubit.get(context)
                              .clickPriority(click: clicked, num: 1);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
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
                            SizedBox(
                              height: 5,
                            ),
                            if (clicked == 1)
                              Container(
                                height: 3,
                                color: HexColor('#38C117'),
                                width: 75,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          AppCubit.get(context).getImageFromGalley();
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image:
                                    AssetImage("assets/images/Path 11623.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'From Gallery',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          AppCubit.get(context).getImageFromCamera();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image:
                                    AssetImage("assets/images/Path 11624.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'From Camera',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 23),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5)),
                          image: DecorationImage(
                              image: FileImage(postImage), fit: BoxFit.cover),
                        ),
                      ),
                      CircleAvatar(
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              AppCubit.get(context).removeImage();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                Spacer(),
                Align(
                  alignment: Alignment(-1, -1),
                  child: InkWell(
                    onTap: () {
                      AppCubit.get(context).postNoteData(
                          priorityId: clicked,
                          ClubId: 1,
                          EmployeeId:
                              AppCubit.get(context).profile?.user?.id ?? 1,
                          description: replyController.text);
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
