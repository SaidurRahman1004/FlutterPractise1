
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Practiseg2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practise 1"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlueAccent,width: 3,),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          height: 220,
          width: 215,
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://i.postimg.cc/4NhHrvd9/Apple-i-Phone-15-Pro-Max-256-GB-Natural-Titanium-1-485x485-optimized.webp"),
                  fit: BoxFit.cover)
                ),
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("iPhone 15 Pro"),
                  Text("\$999"),

                ],
              ),
              Text("A magical new way to interact with iPhone."),
            ],
          ),
        ),
      ),
    );

  }

}