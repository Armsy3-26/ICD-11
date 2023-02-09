import 'dart:io';

import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  File? image;
  final imagePic = ImagePicker();
  bool textScanning = false;
  String? scannedText;

  Future<void> getImagePhoto() async {
    final PickedFile? pickedFile =
        await imagePic.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      textScanning = true;
      image = File(pickedFile.path);
    }

    update();
  }

  Future<void> recogniseImage(File image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);

    await textDetector.close();
    scannedText = "";

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = "$scannedText${line.text}\n";

        print(line.text.toUpperCase());
      }
    }
    textScanning = false;

    update();
  }
}
