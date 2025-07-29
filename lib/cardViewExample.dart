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

/*
🔷 Card Widget কী?
Flutter-এর Card Widget হলো এমন একটি container যেটা দেখতে স্মার্ট ও সুন্দর — material design অনুযায়ী।
এটি সাধারণত কোনো item-এর details, profile box, contact info, list item ইত্যাদি দেখাতে ব্যবহৃত হয়।

🔹 Card Widget এর Properties:
| Property    | Description                  |
| ----------- | ---------------------------- |
| `child`     | কার্ডের ভিতরে যেটা থাকবে     |
| `elevation` | কার্ডের ছায়া (shadow depth) |
| `shape`     | corner round করতে            |
| `color`     | ব্যাকগ্রাউন্ড রঙ             |
| `margin`    | বাইরের ফাঁকা জায়গা           |


     */
