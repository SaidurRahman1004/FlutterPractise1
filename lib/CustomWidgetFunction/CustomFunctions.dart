import 'package:flutter/material.dart';
class CustomFunctions extends StatefulWidget {
  const CustomFunctions({super.key});

  @override
  State<CustomFunctions> createState() => _CustomFunctionsState();
}

class _CustomFunctionsState extends State<CustomFunctions> {
  bool isDark = false;  //প্রথমিক অবস্থাই ডার্ক Mode OFF ,light থাকবে

  TextEditingController _nameC = TextEditingController();
  TextEditingController _emailC = TextEditingController();
  TextEditingController _passC = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _pass = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //lightMoge
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      //DarktMoge
      darkTheme: ThemeData(primarySwatch: Colors.blue,brightness: Brightness.dark),
      //ThemeMode
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text("All CustomFunctions",),),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameC,
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      hintText: "Ex. Hiru",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                    ),
                  ),
                  SizedBox(height: 10,),


                ],

              ),)
        ),
    ));
  }
}
