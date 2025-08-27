
//Practice Task 7.1 — setState() (What, Why, How) Submitted
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleCounterApp extends StatefulWidget {
  const ToggleCounterApp({super.key});

  @override
  State<ToggleCounterApp> createState() => _ToggleCounterAppState();
}

class _ToggleCounterAppState extends State<ToggleCounterApp> {
  int _count = 0;  //প্রাথমিক অবস্থায় স্ক্রিনে ০ সো করবে
  bool _isEnabled = false;  //প্রাথমিক অবস্থায় স্ক্রিনে সুইচ অফ সো করবে

  void _increment(){  //প্রেস করলে কাউন্ট বাড়বে এই ফাওংশন
    // if(!_isEnabled) return;
    // setState(() {
    //   _count++;
    // });

    if(_isEnabled){
      setState(() {
        _count++;
      });
    }
  }
   void _reset(){ //প্রেস করলে কাউন্ট ০ হবে এই ফাওংশন
    if(!_isEnabled) return;
    setState(() {
      _count=0;
    });
   }


  void _toogle(){ //সুইচ টগল এর ফাংশন!এটি true কে False এবং False কে True করবে
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggle Counter App"),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          color: CupertinoColors.lightBackgroundGray,
          child: Container(
            height: 300,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Count $_count",style: const TextStyle(fontSize: 18),),
                Switch(value: _isEnabled, onChanged: (_)=>_toogle()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){_increment();}, icon: Icon(Icons.add)), //প্রেস করলে কাউন্ট বাড়বে
                    IconButton(onPressed: (){_reset();}, icon: Icon(Icons.lock_reset_outlined)),  //প্রেস করলে কাউন্ট reset হবে
                  ]

                )



              ],


            ),
          ),
        ),
      ),
    );
  }
}
