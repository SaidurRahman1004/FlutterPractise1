
///🧪 Practice Task 6.25:Ans::Flutter Stack Layout – UI Overlapping + Layering
import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgetFunction/CustomFunctions.dart';
//task1
class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Example"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage("https://luxurywatchbd.com/wp-content/uploads/2021/12/lmaiwescgjgvsdga.jpg"),fit: BoxFit.cover),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.45),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Smart Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.white),),
                SizedBox(height: 5,),
                ElevatedButton(onPressed: (){
                  cusSnk.customSnkbar(context, "You Cart this product");
                }, child: Text("Buy Now",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.redAccent),))

              ],
            ),
          ],
        ),
      ),

    );
  }
}

///Another Example task 2
class Stack2Ui extends StatelessWidget {
  const Stack2Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Example"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,
              left: 10,
                child: Container(
                  width: 150,
                  height: 100,
                  color: Colors.blue,
                ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 80,
                width: 50,
                child: Icon(Icons.star,color: Colors.redAccent,size: 30,),
                
              ),
            ),

          ],

        ),
      ),

    );
  }
}


