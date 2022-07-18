import 'package:club_app/models/remarker/remarker_model.dart';
import 'package:club_app/models/userModel/userModel.dart';
import 'package:club_app/modules/replay/replay.dart';
import 'package:club_app/network/endpoints.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

final f = new DateFormat('dd/MM/yyyy HH:mm');

class Remarker extends StatelessWidget {
  const Remarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    AppCubit.get(context).remarkerModel!.data![0].createdAt!.split('T');
    print(AppCubit.get(context).profile?.user?.name);
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
                    icon: const Icon(Icons.notifications_none_rounded))
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
                      navigateTo(context, Replay());
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

Widget buildRemarkerItem(context, Data? remarkerData) => InkWell(
      onTap: () {
        print(remarkerData?.filePath);
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
                if (remarkerData.fileType == 'Video')
                  const Image(
                      image:
                          AssetImage("assets/images/Icon feather-video.png")),
                const SizedBox(
                  width: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                if (remarkerData.fileType == 'Image')
                  const Image(
                      image:
                          AssetImage("assets/images/Icon feather-image.png")),
              ],
            ),
          ),
          Card(
            elevation: 4,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              topRight: Radius.circular(7),
            )),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: double.infinity,
              height: 170,
              child: Column(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(remarkerData.filePath ??
                                'https://t4.ftcdn.net/jpg/02/51/95/53/240_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg'),
                            fit: BoxFit.contain)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
