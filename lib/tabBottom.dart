import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listview.dart';
import 'gridExample.dart';
import 'main.dart';
import 'cardViewExample.dart';
import 'navigatorPassData.dart';

class ExampleOfAllList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 5,
          child:Scaffold(
            appBar: AppBar(title: Text("ListTypeContent"),
              backgroundColor: Colors.yellowAccent,
              bottom: TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.green,
                indicatorColor: Colors.red,
                indicatorWeight: 4,
                isScrollable: true,
                tabs: [
                Tab(icon: Icon(Icons.home),text: "Home",),
                Tab(icon: Icon(Icons.list),text: "ListView",),
                Tab(icon: Icon(Icons.grid_3x3),text: "Gridview",),
                Tab(icon: Icon(Icons.card_giftcard),text: "Card",),
                Tab(icon: Icon(Icons.list),text: "lObe",),


              ],),
            ),
            body: TabBarView(children: [
              HomeActivity(),
              listExample(),
              gridExample(),
              cardViewExample(),
              navigatorPassData(),


            ],),
          ) ,
      ),
    );
  }

}