//Practice Task 7.2 – Lifting State Up & Callback Pattern Submit:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exampleOfLiftingCallback extends StatelessWidget {
  const exampleOfLiftingCallback({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ParentWidgetE(),
    );
  }
}

class ParentWidgetE extends StatefulWidget {
  const ParentWidgetE({super.key});

  @override
  State<ParentWidgetE> createState() => _ParentWidgetEState();
}

class _ParentWidgetEState extends State<ParentWidgetE> {
  int _count = 0; //স্ক্রিনে ডিফল্ট মান!যা একশন অনুযায়ী আপডেওট হবে!
  void _increment() {  //বাটন প্রেসে মান বাড়বে!
    setState(() {
      _count++;
    });
  }
  void _reset() {  //মান রিসেট বা ০ হবে
    setState(() {
      _count=0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lifting State Up Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 200,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWidget(Count: _count),
                    ActionWidget(incriment: _increment, reset: _reset)
                  ],
                ),

              ),
            ),
          ],

        ),
      ),
    );
  }
}
///Child Widget 1 (Display)
class DisplayWidget extends StatelessWidget {
  const DisplayWidget({super.key,required this.Count});
  final int Count;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Count : $Count",
      style: TextStyle(
          fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
//Child Widget 2 (Controls)

class ActionWidget extends StatelessWidget {
  final VoidCallback incriment;
  final VoidCallback reset;
  const ActionWidget({super.key,required this.incriment,required this.reset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: incriment, icon: Icon(Icons.add)),
        IconButton(onPressed: reset, icon: Icon(Icons.refresh)),
      ],
    );
  }
}


