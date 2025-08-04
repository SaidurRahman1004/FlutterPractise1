import 'package:flutter/material.dart';
import 'package:myapp/TabBarBottomNavigationBar.dart';
class CustomFunctions extends StatelessWidget {
  const CustomFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    //TabBar Structure
    return  DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(title: Text("TabBar"),backgroundColor: Colors.red,
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.home), text: "Bottom"),
            Tab(icon: Icon(Icons.star), text: "Star"),
            Tab(icon: Icon(Icons.settings), text: "Settings"),
          ],),
        ),

        body: TabBarView(children: [
          Center(child: BottomNavigationBarCustom()),
          Center(child: tabbarCustom()),
          Center(child: Text("Settings Page")),
        ]),

      ),
    );
  }
}

//////////
class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() => _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomNavigationBar"),),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard)),
        BottomNavigationBarItem(icon: Icon(Icons.message)),
        BottomNavigationBarItem(icon: Icon(Icons.settings)),
      ],
          currentIndex: selectedIndex,
          onTap: (index){}
      ),
    );
  }
}
