import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePreview extends StatelessWidget {
  final String imageUrl;
  const ImagePreview({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoomed Image'),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(microseconds: 700),
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
