import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed:(){
              print("your Text is ${name.text}");
            } , child: Text("Submit")),



          ],

        ),
      ),
    );
  }
}