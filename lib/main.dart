import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SecondPage.dart';
import 'layoutP.dart';
import 'practisePage.dart';

void main(){
  runApp(const MyApp());
}
///এখানে ২ টি ক্লাস MyApp,HomeActivity !MyApp ক্লাসে HomeActivity কে home: এ ডিফাইন করা হয়েছে যা এপ চালু হলে প্রাথমিক স্ক্রিন হিসেবে দেখাবে!
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(  //এটার ভিতর এপের সমস্ত Ui সেট করা করা হয়!ও ডিজাইন করা হয়!এটার ভিতর কোরের থিম সেট করা যায়!এপের ল্যান্ডিং পেজ নিয়ন্তন!

      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
        home: HomeActivity());


  }

}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});


  // ইমেইল লঞ্চ করার ফাংশন
  //////////////////////////////////////////////////////////////////////
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'example@example.com',
      query: 'subject=Flutter Email&body=Hi, I want to contact you!',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      print('Could not launch email');
    }
  }
/////////////////////////////////////////////////////////////////////////////////////   Snackbar হলো Flutter-এ একটি ছোট Notification বার যেটা স্ক্রিনের নিচে কিছু সময়ের জন্য ভেসে উঠে।
  ///Snackbar1 function  //এটি কল করলেই ভিতরের কনটেন্ট সো হবে!appbar এর Actionbar এর Snackbar
  ButtonSnackbar(msg,context){                                             //ButtonSnackbar(msg, context): এটি একটি ফাংশন যা দুটি আর্গুমেন্ট নেয়:msg: এটি একটি স্ট্রিং যা SnackBar-এ প্রদর্শিত হবে।,context: এটি BuildContext অবজেক্ট, যা উইজেট ট্রি-তে বর্তমান উইজেটের অবস্থান নির্দেশ করে এবং ScaffoldMessenger-কে খুঁজে পেতে সাহায্য করে
    return ScaffoldMessenger.of(context).showSnackBar(                     //ScaffoldMessenger.of(context): এটি ScaffoldMessengerState-এর একটি ইনস্ট্যান্স প্রদান করে, যা SnackBar দেখানোর জন্য দায়ী। of(context) মেথডটি উইজেট ট্রি-তে সবচেয়ে কাছের ScaffoldMessenger-কে খুঁজে বের করে।
      SnackBar(content: Text(msg))                                        //SnackBar(content: Text(msg)): এটি একটি SnackBar উইজেট তৈরি করে।
    );
  }
///////////////////////////////////////////////////////////////////////////////
  ///Snackbar1 function
ButtonSnack(BuildContext context){   //এটি কল করলেই ভিতরের কনটেন্ট সো হবে!appbar এর Actionbar এর Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("This is snackbar 2 Custom"),
        duration: Duration(seconds: 4),
      )

    );
  }
///////////////////////////////////////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Scaffold(                                            //Scaffold` একটি Material Design লেআউট প্রদান করে, যেখানে আপনি অ্যাপের UI উপাদানগুলো সাজাতে !Scaffold` হলো একটি পূর্ণাঙ্গ স্ক্রিনের কাঠামো তৈরির জন্য ব্যবহৃত উইজেট। এটি একটি ঘরের মতো, যার মধ্যে অ্যাপের বিভিন্ন অংশ যেমন - টপ বার (AppBar), বডি (body), নিচের নেভিগেশন বার (BottomNav) ইত্যাদি রাখা যায়।
///Appbar...
      appBar: AppBar(                                           ////app এর নেভিগেশন বার!
        title: Text("NavBar"),                                           // AppBar টাইটেল
        backgroundColor: Colors.amber,                                  // হলুদ ব্যাকগ্রাউন্ড!AppBar-এর ব্যাকগ্রাউন্ড রঙ নির্ধারণ করে
        titleSpacing: 5,                                                 // বাঁ পাশে থেকে কিছু দূরে!টাইটেল আর বাঁ পাশের আইকনের মাঝে ফাঁকা জায়গা (padding) দেয়
        //centerTitle: true,                                               // টাইটেল মাঝখানে বসবে
        toolbarHeight: 70,                                                // AppBar এর উচ্চতা 70 !AppBar এর উচ্চতা কতো হবে (default: 56)
        toolbarOpacity: 1,                                                 // 100% স্পষ্ট! AppBar-এর অপাসিটি/স্বচ্ছতা (0.0 = একদম স্বচ্ছ, 1.0 = একদম অস্পষ্ট)
        elevation: 5,                                                    // নিচে 3D ছায়া!AppBar এর নিচে shadow depth (ছায়া) দেয়

        actions: [
          IconButton(onPressed: (){ButtonSnackbar("This is Snackbar 1", context);}, icon: Icon(Icons.smart_button)),  //ButtonSnackbar call/এই আইকনে অনপ্রেসে ButtonSnackbar ফাংশন কল করা হয়েছে এবং ফাঙ্গশনে প্যরামিটারে msg " মেসেজ" ,context পাস করা হয়েছে
          IconButton(onPressed: (){ButtonSnack(context);}, icon: Icon(Icons.comment)), //এই আইকনে ক্লিক করলে ButtonSnack ফাংশন ডিরেক্ট কল হয় এর ভিতরের কন্টেন্ত স্নাকবারে সো করে! ButtonSnack call
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){}, icon: Icon(Icons.email)),
        ],
      ),
      ///////////////floatingActionButton একটি গোলাকার বাটন যেটা স্ক্রিনের নিচে ডান পাশে ভেসে থাকে (floating position)।
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 25,
        child: Icon(Icons.smart_button),
        //tooltip: "Add Something",   //বাটনে মাউস রালে এই লেখা সো হবে
        heroTag: AutofillHints.gender,                                              //Hero Animation এর জন্য ট্যাগ
        onPressed: (){                                                            //onPressed   ক্লিক করলে যা হবে,FloatingActionButton এ ক্লিক করলে onPressed এর আইটেম এক্সেকিউট হবে!
          ButtonSnackbar("This is floting action button", context);                //FloatingActionButton এ ক্লিক করলে onPressed এর এই ButtonSnackbar সো হবে!This is floting action button
        },),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,                                    //FAB-এর অবস্থানও পরিবর্তন !মাঝ বরাবর নিচে!FAB সবসময় Scaffold এর মধ্যে থাকতে হয়।

      ///bottomNavigationBar   এটি Flutter-এর এমন একটি Widget যা স্ক্রিনের নিচে একটি নেভিগেশন বারের মতো থাকে — যেখানে একাধিক আইকন + লেবেল থাকে।
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        mouseCursor: SystemMouseCursors.grab,
        backgroundColor: Colors.amberAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail),label: "Mail",),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda),label: "View"),
        ],
        onTap: (int index){
          if(index == 0){
            _launchEmail();
          }else if(index==1){
            ButtonSnackbar("This is Home", context);
          }else if(index==2){
            ButtonSnackbar("This is View", context);
          }
        },

      ),

      /////Navigation Drawer     Flutter-এ Navigation Drawer হলো এমন একটি UI এলিমেন্ট যেটা স্ক্রিনের বাম পাশে থাকে এবং স্লাইড করে খোলে।
      drawer: Drawer(
        child: ListView(
          children: [
            //Drawer Head
            DrawerHeader(child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black12),
              currentAccountPicture: Image.network("https://i.postimg.cc/RFTxcvKh/profile-pic-1.png"),
                accountName: Text("Saidur Rahman" ,style: TextStyle(color: Colors.black),),
                accountEmail: Text("siyambn705@gmail.com",style: TextStyle(color: Colors.black),),
              onDetailsPressed: (){
                ButtonSnackbar("This is Profile Header", context);
              },
            ),
            ),
            /////drawer Lists
            ListTile(
              leading: Icon(Icons.one_k),
              title: Text("SecondPage",style: TextStyle(color: Colors.blue),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));

              },
            ),
            ListTile(
              leading: Icon(Icons.pages),
              title: Text("LayoutPAge"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>layoutP()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shower),
              title: Text("What"),
              onTap: (){
                ButtonSnackbar("This is ListTile form Navigation Drawer", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.three_k),
              title: Text("TestPAge"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>practisePage()));
              },
            ),
          ],
        ),
      ),

    body: Center(
      child: SingleChildScrollView(                      // 🔁 পুরো স্ক্রিনকে Scrollable করে (Vertical Scroll)
        scrollDirection: Axis.vertical,                // ↕️ Scroll হবে উপরে-নিচে (Column এর জন্য সাধারণত vertical)

        child: Column(                                  // ⬇️ স্ক্রিনে UI এলিমেন্টগুলো একটার নিচে একটা (Vertical Layout)
          children: [

            Container(                                  // 🔲 একটি Box/Block যার ভিতরে ইমেজ ও টেক্সট থাকবে
              height: 400,                              // 🔺 Box এর উচ্চতা 400 px
              width: 350,                               // 🔻 Box এর প্রস্থ 350 px
              padding: EdgeInsets.all(15),              // ⛔ ভিতরের content এর চারপাশে 15 px ফাঁকা
              color: Colors.tealAccent,                 // 🎨 Box এর ব্যাকগ্রাউন্ড রঙ Teal Accent

              child: SingleChildScrollView(             // 📦 Container এর ভিতরের Content ও Scrollable
                scrollDirection: Axis.vertical,         // ↕️ Scroll হবে উপরে-নিচে (ভেতরের Column অনেক বড় হলে কাজ দেবে)

                child: Column(                          // ⬇️ Box এর ভিতরে UI গুলো লম্বাভাবে বসবে
                  children: [

                    Image.network(                      // 🖼️ ইন্টারনেট থেকে একটি ইমেজ লোড করে দেখায়
                        "https://i.postimg.cc/RFTxcvKh/profile-pic-1.png"
                    ),

                    SizedBox(height: 15),               // ↕️ ইমেজ আর টেক্সট এর মাঝে 15 px ফাঁকা

                    Text(
                      "SR Sheam",                       // 🔤 “SR Sheam” টেক্সট দেখাবে
                      style: TextStyle(                 // 🎨 টেক্সট এর স্টাইল কনফিগার করা হয়েছে
                          fontSize: 22,                   // 🔠 ফন্ট সাইজ: 22
                          fontWeight: FontWeight.bold,    // 🔸 মোটা/গাঢ় লেখার জন্য
                          color: Colors.yellow            // 🎨 টেক্সট এর রঙ: হলুদ
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ),

    ///body with container
     /* body: Center(
        child: Container(
          height: 950,
          width: 800,
          margin: EdgeInsets.all(70),
          padding: EdgeInsets.all(50),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(color: Colors.green,border: Border.all(color: Colors.black)),
          child: Image.network("https://i.postimg.cc/RFTxcvKh/profile-pic-1.png"),

        ),
      ),

      */


    );

  }
}