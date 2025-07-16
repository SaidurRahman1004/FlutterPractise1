import 'package:flutter/material.dart';
import 'SecondPage.dart'; // ধরে নিচ্ছি SecondPage.dart ফাইলটি আছে এবং SecondPage ক্লাসটি সংজ্ঞায়িত করা আছে।

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder( // <-- এখানে Builder উইজেট যোগ করুন
        builder: (BuildContext innerContext) { // <-- একটি নতুন context তৈরি হচ্ছে
          return Scaffold(
            appBar: AppBar(title: Text("Navbar appBar: AppBar() ")),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "এটি এপের বডি!যা মাঝখানে!এটি টেক্সট !এখানে আরো উইজেট রাখা হবে পরপর নিচে বা উপররে",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text("This is New Text"),
                  ElevatedButton(
                    onPressed: () {
                      // এখন innerContext ব্যবহার করুন, কারণ এটি Navigator এর নিচে
                      Navigator.push(innerContext, MaterialPageRoute(builder: (context) => SecondPage()));
                    },
                    child: Text("ClickSp1"),
                  ),
                  ElevatedButton(onPressed: () {
                    print("Button Clicked 1");
                  }, child: Text("এটি বাটন টেক্সট 1")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        print("Button Clicked 2");
                      }, child: Text("এটি বাটন টেক্সট 2"),),
                      ElevatedButton(onPressed: () {
                        print("Button Clicked 3");
                      }, child: Text("এটি বাটন টেক্সট 3"),) ,
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}