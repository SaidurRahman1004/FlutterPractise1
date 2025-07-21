import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  final TextEditingController eml = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();      // 🔐 এটি ফর্মকে নিয়ন্ত্রণ করার জন্য একটি Global Key

//Snackbar Function
  Snkbtn(mess,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mess))
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //text Feild creating
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Email"),
              controller: eml,
            ),
          ),
          Padding(padding: EdgeInsets.all(15), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Passkey"),controller: pass,),),
          Padding(padding: EdgeInsets.all(17),child: ElevatedButton(onPressed: (){
            if(eml.text=="ab@gmail.com" && pass.text=="12345"){
              Snkbtn("Login Successful", context);
            }else{
              Snkbtn("Login Failed", context);
            }
          }, child: Text("Submit"),),),


        ],
      ),
    );
  }


}