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
///practise  Row, Column, Expanded (Beginner Friendly)
/*
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

 */

///Step 6.3 Task Container, Margin, Padding, SizedBox, Alignment
/*
class practisePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task6.3"),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Center(
          child: Container(
            height: 151,
            width: 300,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Colors.lightBlueAccent,
            child: Column(
              children: [
                Text("Hello Layout"),
                SizedBox(height: 20),
                Text("You're learning Flutter"),

              ],
            ),
          ),
        )
    );

  }


}

 */

///6.4: Row vs Column – Advanced Concepts + Alignment + CrossAxis
/*
class practisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // ✅ উপরের থেকে নিচে সমানভাবে ফাঁকা
        crossAxisAlignment: CrossAxisAlignment.center,     // ✅ বাম থেকে ডানে মাঝখানে রাখবে
        children: [
          Container(
            height: 80,
            width: 100,
            color: Colors.red,
            child: Center(child: Text("One", style: TextStyle(color: Colors.white))),
          ),
          Container(
            height: 80,
            width: 100,
            color: Colors.green,
            child: Center(child: Text("Two", style: TextStyle(color: Colors.white))),
          ),
          Container(
            height: 80,
            width: 100,
            color: Colors.blue,
            child: Center(child: Text("Three", style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }
}

 */
//Task 6.5:Ans SizedBox, Expanded, Spacer – Flutter Layout
/*
class practisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.red,height: 100,child: Text("Box1"),)),
          SizedBox(width: 10),
          Container(width: 80, height: 100, color: Colors.green, child: Center(child: Text("Box2")),),
          SizedBox(width: 10),
          Expanded(child: Container(color: Colors.blue,height: 100,child: Text("Box3"),)),

        ],
      ),
    );
  }
}

 */

// Task 6.6:Ans Stack এবং Positioned Widget
/*
class practisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 80,
                width: 80,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */

//🎯 Task 6.7 ListView, ListTile, ListView.builder
class practisePage extends StatelessWidget {
  var name = ["Rohan", "Priya", "David", "Siam", "Fatima", "Nabil", "John", "Maria", "Sumit", "Luna"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(name[index]),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("This is ${name[index]}");
                },
              );
            }
        ),
      ),
    );
  }
}

