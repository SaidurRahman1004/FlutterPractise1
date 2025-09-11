import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OstadDialogSnkbar extends StatelessWidget {
  OstadDialogSnkbar({super.key});

  List<Map<String, dynamic>> Products = [ //List Collection
    {"name": "Mobile", "icon": Icons.mobile_friendly},
    {"name": "Laptop", "icon": Icons.laptop_mac},
    {"name": "Tablet", "icon": Icons.tablet_mac},
  ];

  //AlertDialog  ব্যবহার: ব্যবহারকারীর সামনে কোনো important তথ্য দেখানো বা confirm চাইতে।
  void CustomAlertDialog(context) {
    showDialog(                                       //showDialog() → ডায়লগ দেখানোর ফাংশন।
      context: context,
      barrierDismissible: false,                      //barrierDismissible: true/false → বাইরে চাপলে ডায়লগ বন্ধ হবে কি না।
      barrierColor: Colors.red,
      builder: (BuildContext context) =>
          AlertDialog(                                 //AlertDialog → মূল container।
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text("ডায়লগের শিরোনাম"),                     //title → ডায়লগের শিরোনাম।
        content: Text(                                    //content → মেসেজ/বডি (Text, Column, Row, Icon, SizedBox ইত্যাদি রাখা যায়)।
          "মেসেজ/বডি (Text, Column, Row, Icon, SizedBox ইত্যাদি রাখা যায়)।",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ok"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  //SimpleDialog 👉 ব্যবহার: Short options লিস্ট দেখানোর জন্য।
  void CustomSimpleDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(           //SimpleDialog → container।
        title: Text("Simple Dialog"),
        children: [                                               //children → লিস্টের ভেতর একাধিক SimpleDialogOption।
          SimpleDialogOption(child: Text("Enter Your Name: ")),   //SimpleDialogOption → প্রতিটি অপশন (Text, TextField বা অন্য widget থাকতে পারে)।
          SimpleDialogOption(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Your Name"),
              ),
            ),
          ),
          SimpleDialogOption(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Submit"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //. Bottom Sheet Dialog 👉 ব্যবহার: নিচ থেকে slide করে আসা menu বা অপশন দেখানোর জন্য।
  void CustomBottomSheet(context) {
    showModalBottomSheet(                //showModalBottomSheet() → ফাংশন।
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) =>
          Container(                              //ভেতরে Container → main UI।
              height: 200,
              child: ListView.builder(
            itemCount: Products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Products[index]["icon"]),
                  title: Text(Products[index]["name"]),
                );
              })),
    );
  }

  //Custom Dialog  👉 ব্যবহার: নিজের ডিজাইন করা Dialog বানানোর জন্য।সবকিছু নিজের  ডিজাইন অনুযায়ী।
  void CustomDialog(context) {
    showDialog(context: context, builder: (BuildContext context)=>Dialog(  //ভেতরে Dialog widget → custom container।
      child: Container(

        child: Column(                                                       //কনটেন্ট → Column / Row / Image / Text / Button ইত্যাদি।
          mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/img1.jpg",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text("This is Custom Dialog"),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("Close")),


            ],
        ),
      ),
    ));
  }

  //Loading Dialog  👉 ব্যবহার: লোডিং বা প্রসেসিং চলার সময় ইউজারকে দেখানোর জন্য।
  void CustomLoadingDialog(context) {
    showDialog(context: context, builder: (BuildContext context)=>Dialog(
      child: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10),
          Text("Loading..."),
        ],
      ),
    ));

  }

  //Snackbar 👉 ব্যবহার: temporary bottom notification।
  void CustomSnackbar(msg,context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),duration: Duration(seconds: 2),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ostad Dialog Snackbar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    CustomAlertDialog(context);
                  },
                  child: Text("AlertDialog"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    CustomSimpleDialog(context);
                  },
                  child: Text("SimpleDialog"),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {CustomBottomSheet(context);}, child: Text("BottomSheet")),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {CustomDialog(context);}, child: Text("Custom Dialog")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {CustomLoadingDialog(context);}, child: Text("Loading Dialog")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {CustomSnackbar("This is Snackbar",context);}, child: Text("Snackbar")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
