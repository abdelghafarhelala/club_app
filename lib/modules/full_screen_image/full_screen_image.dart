import 'package:flutter/material.dart';

class FullScreenImageScreen extends StatelessWidget {
  final String? imagePath;
  const FullScreenImageScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransformationController controller = new TransformationController();
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
        ),
        body: InteractiveViewer(
          transformationController: controller,
          clipBehavior: Clip.none,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imagePath!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}
