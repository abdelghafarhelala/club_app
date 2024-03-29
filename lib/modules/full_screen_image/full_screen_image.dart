import 'package:flutter/material.dart';

class FullScreenImageScreen extends StatefulWidget {
  final String? imagePath;
  const FullScreenImageScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<FullScreenImageScreen> createState() => _FullScreenImageScreenState();
}

class _FullScreenImageScreenState extends State<FullScreenImageScreen>
    with SingleTickerProviderStateMixin {
  TransformationController controller = new TransformationController();
  AnimationController? animationController;
  Animation<Matrix4>? animation;
  @override
  void initState() {
    // TODO: implement initState
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            controller.value = animation!.value;
          });
    controller = TransformationController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              icon: const Icon(Icons.notifications_none_rounded),
              color: Colors.black,
              iconSize: 30,
            )
          ],
        ),
        body: Center(
          child: InteractiveViewer(
            transformationController: controller,
            // panEnabled: false,
            onInteractionEnd: (details) {
              if (details.pointerCount < 1) {
                restAnimation();
              }
            },
            minScale: 1,
            maxScale: 3,
            clipBehavior: Clip.none,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
  }

  void restAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.bounceIn));
    animationController!.forward(from: 0);
  }
}
