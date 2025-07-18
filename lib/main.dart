import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SecondPage.dart';
import 'layoutP.dart';

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
            DrawerHeader(child: Text("This is Drawer")),
            ListTile(
              leading: Icon(Icons.one_k),
              title: Text("SecondPage",selectionColor: Colors.blue,),
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
          ],
        ),
      ),

      body: Text("This is Body"),


    );

  }
}