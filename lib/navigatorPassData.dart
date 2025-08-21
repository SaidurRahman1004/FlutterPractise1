import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class navigatorPassData extends StatelessWidget{
  const navigatorPassData({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Page1"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>page2()));}, child: Text("go to page 2")),
              SizedBox(height: 5),
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>page3("Data from page 1")));}, child: Text("go to page 3")),
            ],
          ),
        ),

      )
    );

  }

}


class page2 extends StatelessWidget{
  const page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("Page2"),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>page3("Data from page 2")));}, child: Text("go to page 3"))
            ],
          ),

        )
    );

  }

}

class page3 extends StatelessWidget{
  String msg;
   page3(
      this.msg,
      {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("Page3"),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>navigatorPassData()));}, child: Text("go to page 1")),

              SizedBox(height: 10),
              Text(msg),

            ],
          ),

        )
    );

  }

}