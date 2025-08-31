import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageShow extends StatelessWidget {
  const ImageShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Show")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/img1.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),

            Image.asset(
              "assets/images/img2.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),

            Image.asset(
              "assets/images/img3.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
