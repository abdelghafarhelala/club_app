import 'package:club_app/shared/appCubit/app_cubit.dart';
import 'package:club_app/shared/appCubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ClubDetails extends StatelessWidget {
  const ClubDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                                image: NetworkImage(
                                  'https://img.freepik.com/free-photo/beautiful-vintage-collage-composition_23-2149479771.jpg?size=338&ext=jpg&uid=R24960600&ga=GA1.2.1634405249.1648830357',
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'City club - Madinaty Cairo ',
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
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://estadat.ivas.com.eg/uploads/clubs/pibhY5i2NmqbOwhQDlWOuG6MtcR17FJdLc8SQCs2.png'),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        color: HexColor('#6f6f6f'),
                        height: 51,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            '45,000 Squre meter',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.fullscreen_outlined,
                        size: 35,
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
