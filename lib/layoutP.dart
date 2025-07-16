import 'package:flutter/material.dart';
class layoutP extends StatelessWidget {
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
            Padding(
                padding: EdgeInsets.all(100),
                 child:             TextField(
                   controller: name,
                   decoration: InputDecoration(
                     labelText: "Enter your name",
                     border: OutlineInputBorder(),
                   ),
                 ),
            ),

            ElevatedButton(onPressed:(){
              print("your Text is ${name.text}");
            } , child: Text("Submit")),
            SizedBox(height: 20),

            Icon(Icons.star),
            Icon(Icons.favorite),



          ],

        ),
      ),
    );
  }
}