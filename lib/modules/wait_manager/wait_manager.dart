import 'package:club_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class WaitManagerApproveScreen extends StatelessWidget {
  const WaitManagerApproveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey2,
      drawer: notDefaultDrawer(context),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => scaffoldKey2.currentState!.openDrawer(),
            icon: const ImageIcon(
              AssetImage('assets/images/Path 10008.png'),
              size: 30,
              color: Colors.black,
            )),
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
      body: Center(
        child: Text(
          'Waiting for Manager Approvement .....',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w700, color: Colors.grey),
        ),
      ),
    );
  }
}
