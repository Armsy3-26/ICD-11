// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(height: 50),
          Container(
            child: Column(children: [
              Container(
                height: 300,
                width: 300,
                child: Card(
                  child: Column(children: const [
                    Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Divider(height: 25),
                    Text("*********************"),
                    Text(
                      """The project uses text recognition to categorize medical documents into specific types. Machine learning algorithms are trained on labeled examples to identify patterns in the text and accurately classify new, unseen documents. This leads to improved organization and faster processing of medical information. The goal is to automate and streamline the document classification process.""",
                      style: TextStyle(
                          wordSpacing: 3,
                          fontSize: 16,
                          fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Contributors: ",
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Card(child: Text("ArmsyXAmirulXVinnyXYorke")),
              const SizedBox(height: 30),
            ]),
          )
        ],
      ),
    );
  }
}
