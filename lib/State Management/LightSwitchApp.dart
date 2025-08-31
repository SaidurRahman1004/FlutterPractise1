//Practise Task Ans:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightSwitch extends StatelessWidget {
  const LightSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return LSApp();
  }
}

class LSApp extends StatefulWidget {
  const LSApp({super.key});

  @override
  State<LSApp> createState() => _LSAppState();
}

class _LSAppState extends State<LSApp> {
  bool _isLightTheme = true;

  void _toggole(){
    setState(() {
      _isLightTheme = !_isLightTheme;
    });
  }

  //changed Theme
   cngTheme(){
    if(_isLightTheme == true){
     return Colors.white;
    }else{
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cngTheme(),
      appBar: AppBar(
        title: Text("Light Switch"),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isLightTheme ? Icon(Icons.light_mode,color: Colors.yellow,size: 60): Icon(Icons.dark_mode,color: Colors.white,size: 60),
                SizedBox(height: 10,),
                Switch(
                    value: _isLightTheme,
                    onChanged: (_)=>_toggole(),
                ),
              ],

            ),
          ),
        ),
      ),

    );
  }
}

