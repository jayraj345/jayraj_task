import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_test/dashboard/model/image_model.dart';
import 'package:task_test/dashboard/widget/image_item.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<ImageModel> imageUrls; // List of image URLs

  const ResponsiveGrid({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth / 100).floor();

    return Obx(() {
      return GridView.count(
        crossAxisCount: crossAxisCount,
        children: imageUrls
            .map((imageUrl) => ImageItem(
                  imageModel: imageUrl,
                ))
            .toList(),
      );
    });
  }
}
