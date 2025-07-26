import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardViewExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardView"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.yellow,
                shadowColor: Colors.green,
                elevation: 80,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(child: Text("Card")),
                ),

              ),
            ),
            SizedBox(width: 15),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.yellow,
                shadowColor: Colors.green,
                elevation: 80,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(child: Text("Card")),
                ),

              ),
            ),

            SizedBox(width: 15),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.yellow,
                shadowColor: Colors.green,
                elevation: 80,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(child: Text("Card")),
                ),

              ),
            ),        ],
        ),
      ),

    );

  }

}