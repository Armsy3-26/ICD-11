import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icd11/controller.dart';

class TakenImage extends StatefulWidget {
  const TakenImage({Key? key}) : super(key: key);

  @override
  State<TakenImage> createState() => _TakenImageState();
}

class _TakenImageState extends State<TakenImage> {
  ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(75.0)),
              child: Image.file(imageController.image!)),
          const SizedBox(height: 4),
          const Text(
            "Click extract data to extract text.",
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
