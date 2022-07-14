import 'package:club_app/modules/replay/replay.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Remarker extends StatelessWidget {
  const Remarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
            appBar: AppBar(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Haitham Shaker"),
                          Text("23-06-2022 12:23"),
                        ],
                      ),
                      Spacer(),
                      Image(
                          image:
                              AssetImage("assets/images/Icon feather-video.png")),
                      SizedBox(
                        width: 5,
                      ),
                      Image(image: AssetImage("assets/images/Line 174.png")),
                      SizedBox(
                        width: 5,
                      ),
                      Image(
                          image:
                              AssetImage("assets/images/Icon feather-image.png")),
                    ],
                  ),
                  Card(
                    child: Container(
                      width: double.infinity,
                      height: 150,
                    ),
                  )
                       ,SizedBox(
              height: 10,
                       ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amr El-Sherif"),
                          Text("23-06-2022 12:23"),
                        ],
                      ),
                      Spacer(),
                      Image(
                          image:
                              AssetImage("assets/images/Icon feather-video.png")),
                      SizedBox(
                        width: 5,
                      ),
                      Image(image: AssetImage("assets/images/Line 174.png")),
                      SizedBox(
                        width: 5,
                      ),
                      Image(
                          image:
                              AssetImage("assets/images/Icon feather-image.png")),
                    ],
                  ),
                  Card(
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      // width:double.infinity,
                    ),
                  ),
                SizedBox(
                        height: 5,
                      ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context,Replay() );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.grey,
                        child: Center(child: Text("Add Reply",style: TextStyle(color: Colors.white,fontSize: 20),)),
                      ),
                    ),
                  ),
                      
                ],
              ),
            ));
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
