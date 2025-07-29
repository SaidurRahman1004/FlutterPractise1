import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//মডিউল ২ button
/*
class GminiPractise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gmini Practise")),
      body: Center(
        child: Container(
          color: Colors.cyan,
          height: 500,
          width: 500,
          child: Column(
            children: [
              Text("Goto Project Using Button"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListStackBuilder()),
                        );
                      },
                      child: Text("ListStack Task")),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () {}, child: Text("List Task")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

 */

// মডিউল ২ Stack ও ListView Task Ans:
/*
class ListStackBuilder extends StatelessWidget{
  var listitm = ["one","two","three","four","five","six","seven","eight","nine","ten"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listitm.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            height: 200,
            margin: EdgeInsets.all(10),
            child: Stack(
              children:<Widget> [
                Image.network('https://i.postimg.cc/7hfT9WzL/145ad8a8af3318681a705f281a44c3a3.jpg',fit: BoxFit.cover,),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Text(listitm[index],style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),

          );

        },
      ),

    );

  }

}

 */
///মডিউল ২-এর শেষ ধাপ,  StatefulWidget
class GminiPractise extends StatefulWidget {
  const GminiPractise({super.key});
  @override
  State<GminiPractise> createState() => _GminiPractiseState();
}

class _GminiPractiseState extends State<GminiPractise> {
  bool _isLiked =false;
  int _likeCount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Gmini StatefulWidget"),backgroundColor: Colors.yellow,),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_isLiked == false){
                      _isLiked = true;
                      _likeCount++;
                    }else{
                      _isLiked = false;
                      _likeCount--;
                    }


                  });

                },
                child: _isLiked == true? Icon(Icons.favorite,color: Colors.red,size: 30,) : Icon(Icons.favorite_border,size: 30),
              ),
              SizedBox(width: 10,),
              Text(_likeCount.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.blue,),),
            ],


          ),
        ),
      ),
    );
  }
}

