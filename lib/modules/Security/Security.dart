import 'package:club_app/models/remarker/remarker_model.dart';
import 'package:club_app/modules/remarker/remarker.dart';
import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:club_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
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
                            },
                            items: AppCubit.get(context)
                                .noteCategoryModel!
                                .data!
                                .map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem<String>(
                                value: e.name,
                                child: Text("${e.name}"),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                          image: AssetImage(
                              'assets/images/Icon feather-filter.png'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildSecurityItem(context,
                        AppCubit.get(context).remarkerModel!.data![index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 0,
                        ),
                    itemCount:
                        AppCubit.get(context).remarkerModel!.data!.length)
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

Widget buildSecurityItem(context, Data model) => InkWell(
      onTap: () {
        navigateTo(context, Remarker());
      },
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
                    Image(
                      image: NetworkImage(model.filePath ??
                          'https://t4.ftcdn.net/jpg/02/51/95/53/240_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg'),
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.noteStatus ?? '',
                      style: TextStyle(color: Colors.green, fontSize: 20),
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
                      model.club ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
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
                        SizedBox(
                          width: 5,
                        ),
                        Container(
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
                                    "assets/images/Ellipse 1278.png",
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
                    image: AssetImage("assets/images/1.png"),
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
    );
