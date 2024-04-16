import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_test/dashboard/model/image_model.dart';
import 'package:task_test/dashboard/view/image_preview.dart';

class ImageItem extends StatelessWidget {
  final ImageModel imageModel;
  const ImageItem({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return ImagePreview(imageUrl: imageModel.previewURL ?? "");
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  imageModel.previewURL ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 20,
              margin: const EdgeInsets.all(5),
              width: Get.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        imageModel.likes.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 11),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: Text(
                            imageModel.views.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 11),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
