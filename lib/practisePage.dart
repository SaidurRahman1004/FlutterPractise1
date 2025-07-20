import 'package:flutter/material.dart';

///task1
/*
class practisePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Testpage"),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Container(
          height: 120,
          width: 250,
          color: Colors.blue,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text("Welcome Saidur"),
              SizedBox(height: 20),
              Text("You are learning Layout!"),
            ],
          ),


        ),
      ),

    );
  }




}

 */

//task 2
class practisePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Task6.2"),
          backgroundColor: Colors.cyanAccent,
        ),

        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(
              color: Colors.red,
              child: Center(child: Text("Box 1",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.yellow),)),
            )),

            Expanded(child: Container(
              color: Colors.green,
              child: Center(child: Text("Box 2",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.yellow),)),
            )),

            Expanded(child: Container(
              color: Colors.blue,
              child: Center(child: Text("Box 3",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.yellow),)),
            )),
          ],
        ),


      ),

    );
  }




}