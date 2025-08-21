import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

//TextFormFieldEditingController
//MyApp
//Email validator Packege
/*
 //(EmailValidator.validate(email));

 ex:
 import 'package:email_validator/email_validator.dart';

validator: (value) {
  if (!EmailValidator.validate(value!)) {
    return 'Invalid email';
  }
  return null;
}

 */
//Practice Task 6.13 Ans
class TextFormFieldEditingController extends StatelessWidget {
   TextFormFieldEditingController({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameC = TextEditingController();
   TextEditingController emailC = TextEditingController();
   TextEditingController passC = TextEditingController();
   
   snkbtn(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFormFieldEditingController"),leading: Icon(Icons.text_decrease),backgroundColor: Colors.amber,),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameC,
                      decoration: InputDecoration(labelText: "Name",hintText: "Enter Your Valid Name",border: OutlineInputBorder(),suffixIcon: Icon(Icons.person)),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailC,
                      decoration: InputDecoration(labelText: "Email",hintText: "Ex: example@gmail.com",border: OutlineInputBorder(),suffixIcon: Icon(Icons.mail)),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email cannot be empty';
                        }else if(value.contains("@")==false || RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)==false){
                          return 'Email is not valid';
                        }
                        return null;

                      },
                    ),
                    SizedBox(height: 10,),

                    TextFormField(
                      controller: passC,
                      decoration: InputDecoration(labelText: "Password",hintText: "Enter Your Valid Password",border: OutlineInputBorder(),suffixIcon: Icon(Icons.lock)),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password cannot be empty';
                        }else if(value.length <= 6){
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        snkbtn("Account Created for [${nameC.text}]!",context);
                      }
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent,foregroundColor: Colors.black), child: Text("Submit"),),

                  ],
                ),
            ),
          ),
      ),

    );
  }
}
