import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icd11/controller.dart';

class ScannedText extends StatefulWidget {
  const ScannedText({Key? key}) : super(key: key);

  @override
  State<ScannedText> createState() => _ScannedTextState();
}

class _ScannedTextState extends State<ScannedText> {
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
              child: Image.asset("assets/cdc11.png")),
          const SizedBox(height: 4),
          Text("Scanned Text: ${imageController.scannedText}",
              style: const TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
