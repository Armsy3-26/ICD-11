import 'package:flutter/material.dart';

class NoImage extends StatefulWidget {
  const NoImage({Key? key}) : super(key: key);

  @override
  State<NoImage> createState() => _NoImageState();
}

class _NoImageState extends State<NoImage> {
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
          const Text(
            "Take document photo for text extraction.",
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
