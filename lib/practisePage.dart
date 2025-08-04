import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///task1
/*
class practisePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Testpage"),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Container(
          height: 120,
          width: 250,
          color: Colors.blue,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text("Welcome Saidur"),
              SizedBox(height: 20),
              Text("You are learning Layout!"),
            ],
          ),


        ),
      ),

    );
  }




}

 */

//task 2
///practise  Row, Column, Expanded (Beginner Friendly)
/*
class practisePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Task6.2"),
          backgroundColor: Colors.cyanAccent,
        ),

        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(
              color: Colors.red,
              child: Center(child: Text("Box 1",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.yellow),)),
            )),

            Expanded(child: Container(
              color: Colors.green,
              child: Center(child: Text("Box 2",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.yellow),)),
            )),

            Expanded(child: Container(
              color: Colors.blue,
              child: Center(child: Text("Box 3",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.yellow),)),
            )),
          ],
        ),


      ),

    );
  }




}

 */

///Step 6.3 Task Container, Margin, Padding, SizedBox, Alignment
/*
class practisePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task6.3"),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Center(
          child: Container(
            height: 151,
            width: 300,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Colors.lightBlueAccent,
            child: Column(
              children: [
                Text("Hello Layout"),
                SizedBox(height: 20),
                Text("You're learning Flutter"),

              ],
            ),
          ),
        )
    );

  }


}

 */

///6.4: Row vs Column – Advanced Concepts + Alignment + CrossAxis
/*
class practisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // ✅ উপরের থেকে নিচে সমানভাবে ফাঁকা
        crossAxisAlignment: CrossAxisAlignment.center,     // ✅ বাম থেকে ডানে মাঝখানে রাখবে
        children: [
          Container(
            height: 80,
            width: 100,
            color: Colors.red,
            child: Center(child: Text("One", style: TextStyle(color: Colors.white))),
          ),
          Container(
            height: 80,
            width: 100,
            color: Colors.green,
            child: Center(child: Text("Two", style: TextStyle(color: Colors.white))),
          ),
          Container(
            height: 80,
            width: 100,
            color: Colors.blue,
            child: Center(child: Text("Three", style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }
}

 */
//Task 6.5:Ans SizedBox, Expanded, Spacer – Flutter Layout
/*
class practisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.red,height: 100,child: Text("Box1"),)),
          SizedBox(width: 10),
          Container(width: 80, height: 100, color: Colors.green, child: Center(child: Text("Box2")),),
          SizedBox(width: 10),
          Expanded(child: Container(color: Colors.blue,height: 100,child: Text("Box3"),)),

        ],
      ),
    );
  }
}

 */

// Task 6.6:Ans Stack এবং Positioned Widget
/*
class practisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 80,
                width: 80,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */

//Task 6.8: Ans : GridView Layout in Flutter
/*


class practisePage extends StatelessWidget{
  snkMass(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  }
  var NameList = ['Abir Ahmed', 'Tasnim Chowdhury', 'Saiful Islam', 'Farhana Akter', 'Imran Hossain', 'Sumaiya Jannat', 'Mehedi Hasan', 'Jannatul Ferdous', 'Rakibul Sheikh', 'Alina Rahman'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("List Example"),),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
            itemCount: NameList.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  print("This is ${NameList[index]}");
                  snkMass(NameList[index],context);    //snack bar ও সো করালাম
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 150,
                  color: Colors.amber,
                  child: Text(NameList[index]),

                ),
              );



            },),
      ),
    );
  }

}

 */

//🎯 Task 6.7 ListView, ListTile, ListView.builder
/*

class practisePage extends StatelessWidget {
  var name = ["Rohan", "Priya", "David", "Siam", "Fatima", "Nabil", "John", "Maria", "Sumit", "Luna"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.4 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(name[index]),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("This is ${name[index]}");
                },
              );
            }
        ),
      ),
    );
  }
}


 */
//Task 6.9: ListTile Customization + Leading, Trailing, Subtitle
/*
class practisePage extends StatelessWidget {
  var nameOccu = [
    {"name": "Siyam", "subtitle": "Flutter Developer"},
    {"name": "Rahim", "subtitle": "Backend Developer"},
    {"name": "Karim", "subtitle": "UI/UX Designer"},
    {"name": "Fatima", "subtitle": "Project Manager"},
    {"name": "Zoya", "subtitle": "QA Engineer"},
  ];

  mysnk(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 6.9 Task"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: nameOccu.length,   
        itemBuilder: (context,index){
          var intro = nameOccu[index];   //nameOccu কে intro ভ্যারিয়েবলে রাখা হয়েছে!
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(intro["name"]![0]), // nameOccu এর name এর প্রথম অক্ষর ধরবে যেমন Siyam এর S
            ),
            title: Text(intro["name"]!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), // name সো করবে nameOccu lisT থেকে!
            subtitle: Text(intro["subtitle"]!,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.call),
            onTap: (){
              print("This is ${intro["name"]}");
            },
            onLongPress: (){   //চাপ দিয়ে ধরলে
              mysnk("${intro["name"]} is selected ${intro["subtitle"]}",context);
            },
          );

        },
      ),
    );
  }
}

 */

//extra

/*
class practisePage extends StatelessWidget {
  int num =0;

  mysnk(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Step 6.9 Task"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: InkWell(

            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Center(child: Text("Click",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow),textAlign: TextAlign.center,)),

            ),
          ),
        ),
      ),

    );

  }


}

 */

//Statefull Widget Simple CounterApp

/*
নিচের কোডটি একটি Flutter Counter App যা StatefulWidget ব্যবহার করে তৈরি করা হয়েছে।
ইউজার একটি বাটনে ক্লিক করলে Counter সংখ্যা বাড়াতে (➕) ও কমাতে (➖) পারে। এখন আমরা একে একেবারে লাইন-বাই-লাইন ব্যাখ্যা করব বাংলা ভাষায়, প্রতিটি লাইনের পাশে কমেন্ট সহ, সুন্দর ফরম্যাটে:
 */
/*
class practisePage extends StatefulWidget {
  const practisePage({super.key});

  @override
  State<practisePage> createState() => _practisePageState();
}

class _practisePageState extends State<practisePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(count.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(onPressed: (){setState(() {
                          count++;
                        });}, child: Icon(Icons.add,size: 30,color: Colors.yellow,)),

                        SizedBox(width: 10,),
                        OutlinedButton(onPressed: (){setState(() {
                          count--;
                        });}, child: Icon(Icons.remove,size: 30,color: Colors.yellow,)),

                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

 */
/*

//নিচের নির্দেশনা অনুযায়ী একটি Flutter UI App বানাও:🔹 ListView এর ভিতরে ৩টি Card থাকবে
///Task 6.10 Ans:  Card Widget in Flutter – Full Beginner Guide  
class practisePage extends StatelessWidget {
  const practisePage({super.key});
  mysnk(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(" Task 6.10 Ans card"),),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Card(
              elevation: 10,
              child: ListTile(
                leading: CircleAvatar(child: Text("S"),),
                title: Text("Siyam"),
                subtitle: Text("Flutter Developer"),
                trailing: Icon(Icons.arrow_forward),
                onLongPress: (){mysnk("Siyam is selected",context);},
                
              ),

            ),
            Card(
              elevation: 10,
              child: ListTile(
                leading: CircleAvatar(child: Text("S"),),
                title: Text("Saidur"),
                subtitle: Text("Kotlin Developer"),
                trailing: Icon(Icons.arrow_forward),
                onLongPress: (){mysnk("Saidur is selected",context);},

              ),

            ),
            Card(
              elevation: 10,
              child: ListTile(
                leading: CircleAvatar(child: Text("HI"),),
                title: Text("Hiru"),
                subtitle: Text("kungfu Developer"),
                trailing: Icon(Icons.arrow_forward),
                onLongPress: (){mysnk("Hiru is selected",context);},

              ),

            ),
          ],

        ),

    );
  }
}

 */
/*
৮. একটি Column-এর mainAxisAlignment কোন দিক বরাবর কাজ করে?
খ) উপর-নিচ (Vertically)
 */
//Task 6.11: Flutter Image + Decoration + Rounded UI
/*
class practisePage extends StatelessWidget {
  String username1 = "Saidur Rahman";
  String username2 = "Siyam";
  final String Imgurl = "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png";
  final String Imgurl2 = "https://i.postimg.cc/bNZdjVSY/o1.jpg";
  snkbar(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("practisePage"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                snkbar("Image clicked by $username1", context);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(Imgurl),fit: BoxFit.cover),
                ),
              
              ),
            ),
            Text("SR Sheam"),
            GestureDetector(
              onTap: (){
                snkbar("Image clicked by $username2", context);
              },

              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(Imgurl2),fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                        spreadRadius: 2,
                      offset: Offset(0,2)
                    )
                  ]
                ),


              ),
            )
          ],

        ),


      ),
    );
  }
}

 */
/// Practice Task 6.14: Ans . Flutter Checkbox, Radio Button, Switch
/*
class practisePage extends StatefulWidget {
  const practisePage({super.key});

  @override
  State<practisePage> createState() => _practisePageState();
}

class _practisePageState extends State<practisePage> {
  bool isChkd = false;
  bool isSwiched = false;
  String slectOptn = "Teacher";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("practisePage"),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                child: CheckboxListTile(
                    value: isChkd,
                    title: Text("I accept terms & conditions"),
                    onChanged: (valu){
                  setState(() {
                    isChkd = valu!;
                  });
                }),
              ),
              SizedBox(height: 10,),
              Text("Select Options"),

              Card(
                elevation: 10,
                child: RadioListTile(title: Text("Teacher"),value: "Teacher", groupValue: slectOptn, onChanged: (value){setState(() {
                  slectOptn = value!;
                });}),

              ),
              Card(
                elevation: 10,
                child: RadioListTile(title: Text("Student"),value: "Student", groupValue: slectOptn, onChanged: (value){setState(() {
                  slectOptn = value!;
                });}),

              ),
              SizedBox(height: 10,),
              SwitchListTile(
                  value: isSwiched,
                  title: Text("Enable Notification"),
                  onChanged: (values){setState(() {
                    isSwiched = values;
                  });}),
            ],
          ),

        ),
      ),
    );
  }
}

 */

///darkmode
/*
class practisePage extends StatefulWidget {
  const practisePage({super.key});

  @override
  State<practisePage> createState() => _practisePageState();
}

class _practisePageState extends State<practisePage> {
  bool isDark = false; //প্রথমিক অবস্থাই ডার্ক Mode OFF ,light থাকবে
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //lightMoge
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      //DarktMoge
      darkTheme: ThemeData(primarySwatch: Colors.blue,brightness: Brightness.dark),
      //ThemeMode
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text("All CustomFunctions",),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchListTile(value: isDark,title: Text("DarkMode"), onChanged: (darkValue){
                setState(() {
                  isDark = darkValue;
                });
              })
            ],
          ),
        ),
      ),
    );


  }
}


 */

///Task 6.15: Flutter AlertDialog, SimpleDialog & BottomSheet
/*
class practisePage extends StatelessWidget {
  const practisePage({super.key});

  void btnSnk(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
//Task 1 AlertDialog Function
  AlartCustomdislog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Do you want to logout?"),
            actions: [
              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> practisePage()));}, child: Text("Cancel")),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Yes")),
            ],

          );
        });
  }
//Task 2 SimpleDialog Function
  SimPleDialogCustomFn(BuildContext context){
    showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: Text("Select Your Gender"),
        children: [
          SimpleDialogOption(
            onPressed: (){btnSnk("You are Selectedn Male", context);},child: Text("Male"),
          ),

          SimpleDialogOption(
            onPressed: (){btnSnk("You are Selectedn Female", context);},child: Text("Female"),
          ),
        ],
      );
    });
  }

  //Task 3 BottomSheet BottomSheet Function
  BottomSheetCustomDialog(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){return Container(height: 200,color: Colors.blue,child: Text("Hello! This is Bottom Sheet"),);},);
  }



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("practisePage"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              AlartCustomdislog(context);

      }, child: Text("AlartDialog")),

            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              SimPleDialogCustomFn(context);

            }, child: Text("SimpleOptionDialog")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              BottomSheetCustomDialog(context);

            }, child: Text("BottomSheet "))
            
            
          ],
        ),
      ),

    );
  }
}

 */
///Practice Task 6.16: Ans: Flutter Advanced Form Validation + Snackbar + Toast Message
/*
class practisePage extends StatefulWidget {
  practisePage({super.key});

  @override
  State<practisePage> createState() => _practisePageState();
}

class _practisePageState extends State<practisePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameC = TextEditingController();

  TextEditingController emailC = TextEditingController();

  TextEditingController passC = TextEditingController();

  snkbtn(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  showToastMessage(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.BOTTOM);
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
                    if(value!.isEmpty || value == null){
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
                    if(value!.isEmpty || value == null){
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
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password",hintText: "Enter Your Valid Password",border: OutlineInputBorder(),suffixIcon: Icon(Icons.lock)),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Password cannot be empty';
                    }else if(value==null || value.length <= 6){
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    snkbtn("Account Created for [${nameC.text}]!",context);
                    showToastMessage("Signup Successful");
                  }
                }, child: Text("Submit"),style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent,foregroundColor: Colors.black),),

              ],
            ),
          ),
        ),
      ),

    );
  }
}

 */

import 'package:flutter/material.dart';

class practisePage extends StatelessWidget {
  const practisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Example"),
        backgroundColor: Colors.teal,
      ),

      drawer: Drawer( // ✅ Drawer শুরু
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            // ✅ Drawer Header (প্রোফাইল UI)
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png"
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Saidur Devo", style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text("saidur@app.com", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            // ✅ Drawer List Options
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context); // Drawer বন্ধ করবে
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Home Clicked")));
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Settings Clicked")));
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged Out")));
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Text("Welcome to Drawer UI!", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}





