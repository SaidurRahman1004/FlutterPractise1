import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomWidgetFunction/CustomFunctions.dart';
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
/*
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

 */

// পরীক্ষা (Exam)  প্রজেক্ট (Project) ডিজিটাল বিজনেস কার্ড" অ্যাপ
/*
এই কোডটি একটি StatelessWidget যা একটি Flutter অ্যাপে ব্যবহারকারীর প্রোফাইল কার্ড দেখায়। কার্ডে ইউজারের ছবি,
 নাম, পেশা, ইমেইল ও ফোন নম্বর রয়েছে। এটি Scaffold, AppBar, Card, ListTile, Row, এবং Icon widget গুলোর সমন্বয়ে তৈরি একটি সাধারণ
 UI layout। এর মাধ্যমে Flutter UI তৈরি ও ডাটা দেখানোর একটি সুন্দর বাস্তব উদাহরণ তৈরি করা হয়েছে।

 */
///মডিউল 2: একটি "ডিজিটাল বিজনেস কার্ড" অ্যাপ
/*
class GminiPractise extends StatelessWidget {                       // 📌 একটি StatelessWidget ক্লাস তৈরি করা হয়েছে যার নাম GminiPractise
  const GminiPractise({super.key});                                   // 🔐 Constructor যা key প্যারামিটার গ্রহণ করে (optional)

  final String Imgurl = "https://i.postimg.cc/jjKRZgRq/profile-pic-1.png";   // 🖼️ একটি image URL স্টোর করার জন্য ফিক্সড স্ট্রিং ভ্যালু

  @override
  Widget build(BuildContext context) {                                     // 🔁 build() method – UI রেন্ডার করার জন্য কাজ করে
    return Scaffold(                                // 🧱 Scaffold – একটি basic layout structure
      appBar: AppBar(                               // 🟦 AppBar – উপরের title bar
        title: Text("Gmini Practise"),              // 📝 AppBar এর মধ্যে টাইটেল
      ),
      body: Center(                                 // 📦 Body কে স্ক্রিনের মাঝে আনবে
        child: Column(                              // ↕️ একের পর এক UI item দেখাতে Column ব্যবহার করা হয়েছে
          children: [
            Container(                              // 📦 একটি container যাতে কার্ডটি রাখা হয়েছে
              height: 220,                          // ↕️ Container এর উচ্চতা 220px
              width: 300,                           // ↔️ প্রস্থ 300px
              child: Card(                          // 🃏 Card widget – সুন্দর Shadow সহ box তৈরি
                margin: EdgeInsets.all(20),         // 🧱 Card এর চারপাশে ২০px margin
                elevation: 30,                      // 🪄 Card এর shadow depth – 30 মানে অনেক উঁচু

                child: Column(                      // ↕️ Card এর মধ্যে এলিমেন্টগুলো সাজানো হয়েছে Column দিয়ে
                  mainAxisSize: MainAxisSize.min,   // 🔧 Card এর height content অনুযায়ী হবে (min মানে যতটুকু দরকার)
                  children: [

                    ListTile(                       // 📋 ListTile – একটি row আকারে ডেটা দেখাতে ব্যবহৃত widget
                      leading: CircleAvatar(        // 🧑 বাম পাশে একটি গোলাকার প্রোফাইল ছবি
                        backgroundImage:NetworkImage(Imgurl),  // 🌐 ইন্টারনেট থেকে প্রোফাইল ইমেজ লোড হচ্ছে
                      ),
                      title: Text("Saidur Rahman"),     // 🔠 টাইটেল – ইউজারের নাম
                      subtitle: Text("App Developer"),  // 📌 সাবটাইটেল – পেশা
                    ),

                    Divider(                        // ➖ একটি divider লাইন (horizontal line)
                      color: Colors.purple,         // 🟣 Divider এর রঙ
                      thickness: 3,                 // 🔁 Divider এর পুরুত্ব ৩px
                      endIndent: 20,                // ↘️ ডান পাশে ২০px ফাঁকা রাখা হয়েছে
                    ),

                    Row(                            // ↔️ একটি row – ইমেইল দেখানোর জন্য
                      mainAxisAlignment: MainAxisAlignment.center,  // ↔️ মাঝ বরাবর অ্যালাইন
                      children: [
                        Icon(Icons.email),          // 📧 Email আইকন
                        Text("saidur0410@gmail.com")// ✉️ Email address
                      ],
                    ),

                    SizedBox(height: 5,),           // ↕️ একটু ফাঁকা জায়গা রাখার জন্য

                    Row(                            // ↔️ একটি row – ফোন নম্বর দেখানোর জন্য
                      mainAxisAlignment: MainAxisAlignment.center,  // ↔️ মাঝ বরাবর অ্যালাইন
                      children: [
                        Icon(Icons.call),           // 📞 Call আইকন
                        Text("01817278961")         // ☎️ ফোন নম্বর
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */

///প্র্যাকটিস টাস্ক Ans:
/*
class GminiPractise extends StatefulWidget {
   const GminiPractise({super.key});


  @override
  State<GminiPractise> createState() => _GminiPractiseState();
}

class _GminiPractiseState extends State<GminiPractise> {
  final TextEditingController _nameC = TextEditingController();
  String _DisplyName = "";
  ///txtStyle Function
  txtStyl(){
    return TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red);
  }
  @override
  void dispose(){
    _nameC.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextField "),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _nameC,
              decoration: InputDecoration(
                labelText:"Enter Yor Name",
                hintText: 'Ex. Hiru',
                border: OutlineInputBorder(),
              ),

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              if(_nameC.text.isNotEmpty){
                setState(() {
                  _DisplyName = _nameC.text;
                });
              }else{
                setState(() {
                  _DisplyName = "Please Enter Your Name";
                });
              }

            }, child: Text("Greet Me")),
            SizedBox(height: 15,),
            Text("Hello, ${_DisplyName}",style: txtStyl(),)
            
          ],
          
        ),
      ),
    );
  }
}

 */

//taSK Ans: TextFormField
class GminiPractise extends StatefulWidget {
  const GminiPractise({super.key});

  @override
  State<GminiPractise> createState() => _GminiPractiseState();
}

class _GminiPractiseState extends State<GminiPractise> {
   snkbtn(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  final _formKey  = GlobalKey<FormState>();
   TextEditingController _nameC = TextEditingController();
   TextEditingController _mailC = TextEditingController();
   String nameDis = "";
   String mailmeDis = "";
   String isSuccess = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form Task"),),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey ,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameC,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please Fill Your Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    hintText: "Ex. Hiru",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                  ),
                ),
                SizedBox(height: 15,),

                TextFormField(
                  controller: _mailC,
                  validator: (value){
                    if(value!.isEmpty || value.contains("@")==false){
                      return "Please Fill Your Valid Email";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    hintText: "Ex. fsgf@gmail.com",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                  ),
                ),
                SizedBox(height: 15,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || value.length < 8){
                      return "Please Fill Your Valid Password";
                    }
                    return null;

                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Enter Your Pass",
                    hintText: "@gsg!Dg",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  if (_formKey .currentState!.validate()) {
                    snkbtn("Registration Successful!!", context);
                    setState(() {
                      nameDis = "Your Name is ${_nameC.text}";
                      mailmeDis = "Your Email is ${_mailC.text}";
                      isSuccess = "Registration Successful!!";
                    });
                  }

                }, child: Text("Register")),
                SizedBox(height: 10,),
                Text(nameDis.toString()),
                SizedBox(height: 10,),
                Text(mailmeDis),
                SizedBox(height: 10,),
                Text(isSuccess),




              ],

            ),)
      ),
    );
  }
}

