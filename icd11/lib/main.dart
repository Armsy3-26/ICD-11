// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icd11/controller.dart';

import 'about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ICD11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ICD11'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        title: const Text(
          "ICD11 CLASSFIER",
        ),
        centerTitle: true,
        actions: [
          IconButton(
              iconSize: 20,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const About()));
              },
              icon: Icon(Icons.info))
        ],
      ),
      body: SizedBox(
        child: imageController.image == null
            ? Center(
                child: Column(
                  children: [
                    SizedBox(height: 250),
                    Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75.0)),
                        child: Image.asset("assets/cdc11.png")),
                    SizedBox(height: 4),
                    Text(
                      "Take document photo for text extraction.",
                      style:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              )
            : Text("Scanned Text: ${imageController.scannedText}",
                style: TextStyle(fontSize: 22)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 230,
        height: 65,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () async {
                    imageController.getImagePhoto();
                  },
                  tooltip: 'Get Image',
                  child: const Icon(Icons.camera),
                ),
                Text(
                  "Get Image",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () async {
                    if (imageController.image != null) {
                      imageController.recogniseImage(imageController.image!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          width: 160,
                          content: Text("No photo for text extraction",
                              style: TextStyle(
                                  fontSize: 10, fontStyle: FontStyle.italic))));
                    }
                  },
                  tooltip: 'Extract Data',
                  child: const Icon(Icons.lens_blur),
                ),
                Text(
                  "Extract Data",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () async {
                    if (imageController.scannedText != null) {
                      imageController.recogniseImage(imageController.image!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          width: 160,
                          content: Text("No text to allocate icd-11",
                              style: TextStyle(
                                  fontSize: 10, fontStyle: FontStyle.italic))));
                    }
                  },
                  tooltip: 'Allocate icd-11',
                  child: const Icon(Icons.class_rounded),
                ),
                Text(
                  "Classify Icd-11",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
