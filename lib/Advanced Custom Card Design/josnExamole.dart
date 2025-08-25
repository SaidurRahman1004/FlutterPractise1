import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonTest extends StatefulWidget {
  const JsonTest({super.key});

  @override
  State<JsonTest> createState() => _JsonTestState();
}

class _JsonTestState extends State<JsonTest> {
   List<dynamic> products = [
    
  ];
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  Future<void> getDAta() async{
    var response = await http.get(url);
    print(" Responce os : $response");
    if(response.statusCode == 200){
      setState(() {
        products = jsonDecode(response.body);

      });

    }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music Playlist')),
      body: Center(
        child: Column(
          children: [
            Text(products.length.toString()),
            ElevatedButton(onPressed: (){
              getDAta();
              }, child: Text("Get Data"))

          ],
        ),
      ),
    );
  }
}
