
///6.17: Practice Task Ans Flutter TabBar & BottomNavigationBar
library;
//Task 1 Ans
import 'package:flutter/material.dart';
class tabbarCustom extends StatelessWidget {
  const tabbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar"),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.home),text: "Home",),
            Tab(icon: Icon(Icons.message),text: "Messege",),
            Tab(icon: Icon(Icons.settings),text: "Settings",),

          ],),
        ),
        body: TabBarView(children: [
          Center(child: BottomNavigationBarCustom()),
          Center(child: Text("Messege Page")),
          Center(child: Text("Settings Page")),
        ]),

      ),
    );
  }
}

////////////////////Task 2 Ans////////////////////////////////////////////////////////////
class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() => _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  snkbtn(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomNavigationBar"),),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Dashboard",),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",),
      ],
        currentIndex: 1,
        selectedItemColor: Colors.red,
        onTap: (index){
        if(index == 0){
          snkbtn("Dashboard", context);
        }
        if(index == 1){
          snkbtn("Search", context);
        }
        if(index == 2){
          tabbarCustom();
        }

        }
      ),
    );
  }
}
/////////////////////////////////Example 2 BottomNavigationBar///////////////////////////////
class BottomNavigationBarCustom2 extends StatefulWidget {
  const BottomNavigationBarCustom2({super.key});

  @override
  State<BottomNavigationBarCustom2> createState() => _BottomNavigationBarCustom2State();
}

class _BottomNavigationBarCustom2State extends State<BottomNavigationBarCustom2> {
  int curentIndex1 = 0;
  final List<Widget> _pages = [
    Center(child: Text("Home")),
    Center(child: Text("Search"))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomNavigationBar"),),
      body: _pages[curentIndex1],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.label),label: "Label"),
        BottomNavigationBarItem(icon: Icon(Icons.message),label: "Messege"),

      ],
        currentIndex: curentIndex1,
        onTap: (index){curentIndex1 = index;},
      ),

    );
  }
}
