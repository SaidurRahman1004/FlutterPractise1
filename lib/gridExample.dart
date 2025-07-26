import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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