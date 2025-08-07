import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomWidgetFunction/CustomFunctions.dart';

class gridExample extends StatelessWidget{

  var mycardItem = [
    {"img": "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png", "title": "Siyam Devo"},
    {"img": "https://i.postimg.cc/tJnDcHjL/received-1211965183511363.jpg", "title": "Hiru r Pola Natok rasel"},
    {"img": "https://i.postimg.cc/Xvx2G8LD/received-1010764821237896.jpg", "title": "HiruDon"},
    {"img": "https://i.postimg.cc/wB9fjPXm/received-1192891685907628.png", "title": "Padraj Arafat"},
    {"img": "https://i.postimg.cc/vBN3XZpr/received-682209511020550.jpg", "title": "Hot Xahid 2 2"},
    {"img": "https://i.postimg.cc/L8tQRR1S/received-990889806002858.jpg", "title": "Dudu Hujur"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Chris Brown"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Olivia Jones"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "James Garcia"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Sophia Rodriguez"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Daniel Martinez"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Ava Hernandez"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Matthew Lopez"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Mia Gonzalez"},
    {"img": "https://i.postimg.cc/mDxzTffY/0.jpg", "title": "Andrew Perez"},
  ];

  //snackbar
  mysnkbar(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("GridExample"),),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              childAspectRatio: 1.2,
            ),
            itemCount: mycardItem.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onLongPress: (){mysnkbar(mycardItem[index]['title'],context);},
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 220,
                  child: Image.network(mycardItem[index]['img']!,fit: BoxFit.fill ),),
              );
            }
        ),



      ),
    );
  }

}


///aNOTHEReXAMPLE
///Practice Task 6.23: Ans Flutter GridView – GridView.builder, GridView.count, GridView.extent

/// GridView.count
class gridCount extends StatelessWidget {
  const gridCount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index){
          return Container(
            color: Colors.amber,
            margin: EdgeInsets.all(5),
            child: Center(
              child: Text("Count Grid"),
            ),
          );
        }),
      ),
    );
  }
}

/// GridView.extent
class gridExtent extends StatelessWidget {
  const gridExtent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: GridView.extent(
        maxCrossAxisExtent: 150,
        children: List.generate(4, (index){
          return Container(
            color: Colors.greenAccent,
            margin: EdgeInsets.all(5),
            child: Center(
              child: Text("Grid Extent"),
            ),
          );
        }),
      ),
    );
  }
}
//GridView.builder
class gridBuilder extends StatelessWidget {
   gridBuilder({super.key});
  mysnkbar(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

   List<Color> boxColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.brown,
    Colors.indigo,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid Builder"),),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10),itemCount: 10, itemBuilder: (context,index){
        return GestureDetector(
          onTap:()=> cusSnk.customSnkbar(context, "Grid Builder ${index}",backgroundColor: boxColors[index]),
          child: Container(
            color: boxColors[index],
            margin: EdgeInsets.all(5),
            child: Center(
              child: Text("Grid Builder ${index++}"),
            ),
          ),
        );

      }),

    );
  }
}

