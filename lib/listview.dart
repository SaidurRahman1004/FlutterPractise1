import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class listExample extends StatelessWidget{
  const listExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      home: ListItemsActivity(),



    );
  }}

class ListItemsActivity extends StatelessWidget{
  //Create Josm Data List
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

  ListItemsActivity({super.key});


//snackbar
  mysnk(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListActivity"),
      ),
      //ListView.builder হলো Flutter-এর একটি বিশেষ Widget, যেটা অনেক ডাটা বা উইজেট লম্বা লিস্টে দেখানোর জন্য ব্যবহার করা হয় অটোমেটিকালি স্ক্রলসহ।
      body: ListView.builder(
        itemCount: mycardItem.length,                                                   //মোট কয়টি widget তৈরি হবে
          itemBuilder: (context,index){                                                    //প্রতিটি আইটেম কিভাবে দেখাবে তা define করে
          return GestureDetector(
            onTap: (){mysnk(mycardItem[index]['title'],context);},                                                                   // Tap করলে কি হবে
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 220,
              child: Image.network(mycardItem[index]['img']!,fit: BoxFit.fill ),


            ),
          );


          }
      ),

    );

  }

}


///ListView Practise Task  6.22: Ans Flutter ListView – Builder, Separated, Horizontal
class ListViewExam extends StatefulWidget {
  const ListViewExam({super.key});

  @override
  State<ListViewExam> createState() => _ListViewExamState();
}

class _ListViewExamState extends State<ListViewExam> {
  List<String> names = ['Siyam', 'Fatima', 'Rohan', 'Maria','Fatima'];

  List<String> profession = [
    'Software Engineer',
    'Doctor',
    'Teacher',
    'Architect',
    'Data Scientist',
  ];

  List<String> product = [
    'Smartphone',
    'Laptop',
    'Headphones',
    'Keyboard',
    'Monitor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Exam!"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Row(
            children: [

              //ListView.builder
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                color: Colors.white38,
                child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text(names[index]),
                      );

                    }),

              ),
              //ListView.separated
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                color: Colors.white38,
                child: ListView.separated(
                  itemCount: profession.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(profession[index]),
                    );

                  },
                  separatorBuilder: (context,index) => Divider(color: Colors.black,),
                ),

              ),
              //Horizontal scroll
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                color: Colors.white38,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.length,
                    itemBuilder: (context,index){
                      return Container(
                        width: 100,
                        margin: EdgeInsets.all(8),
                        color: Colors.amberAccent,
                        alignment: Alignment.center,
                        child: Text(product[index]),
                      );

                    }
                ),

              ),
            ],
          ),


      ),

    );
  }
}
