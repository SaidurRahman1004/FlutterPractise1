
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
          padding: const EdgeInsets.all(10.0),
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
          width: 215,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ছবির কন্টেইনারের কোণাগুলোও মূল কন্টেইনারের মতো গোলাকার করলে আরও সুন্দর লাগবে।
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network("https://i.postimg.cc/4NhHrvd9/Apple-i-Phone-15-Pro-Max-256-GB-Natural-Titanium-1-485x485-optimized.webp",height: 150,width: double.infinity,fit: BoxFit.cover,),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("iPhone 15 Pro"),
                  Text("\$999"),

                ],
              ),
              const SizedBox(height: 4),
              Text("A magical new way to interact with iPhone."),
            ],
          ),
        ),
      ),
    );

  }

}