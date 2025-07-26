import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

// মডিউল ২ Stack ও ListView Task Ans:
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