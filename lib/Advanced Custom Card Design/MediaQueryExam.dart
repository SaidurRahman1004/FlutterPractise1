/*
MediaQuery অ্যাডভান্সড (Orientation এবং Breakpoints) 📐
এটা LayoutBuilder এর মতোই কাজ করে, কিন্তু এখানে সরাসরি device information পাওয়া যায়।

🟢 MediaQuery কী?

👉 MediaQuery হলো Flutter এর একটা Widget/Helper, যেটার মাধ্যমে আমরা device এর নিচের তথ্যগুলো বের করতে পারি:

Screen Size → Width & Height
Device Orientation → Portrait / Landscape
Pixel Ratio
Padding (SafeArea info)
Text Scaling Factor

🟢 Syntax:
MediaQuery.of(context).size.width   // স্ক্রিনের প্রস্থ
MediaQuery.of(context).size.height  // স্ক্রিনের উচ্চতা
MediaQuery.of(context).orientation  // Orientation (Portrait/Landscape)


১. তত্ত্ব (Explanation)
Orientation (ডিভাইসের দিক)
Orientation বলতে বোঝায় ডিভাইসটি লম্বালম্বিভাবে (portrait) নাকি আড়াআড়িভাবে (landscape) ধরা আছে। MediaQuery আমাদের সরাসরি এই তথ্যটি দেয়।
Portrait: যখন ডিভাইসের উচ্চতা তার প্রস্থের চেয়ে বেশি থাকে (যেমন ফোন স্বাভাবিকভাবে ধরার সময়)।
Landscape: যখন ডিভাইসের প্রস্থ তার উচ্চতার চেয়ে বেশি থাকে (যেমন ফোনটি ঘুরিয়ে ভিডিও দেখার সময়)।

এই তথ্যের ওপর ভিত্তি করে UI পরিবর্তন করা খুবই সাধারণ একটি ব্যাপার। যেমন, portrait মোডে একটি লিস্ট দেখানো যেতে পারে, কিন্তু landscape মোডে পর্যাপ্ত জায়গা থাকায় সেই লিস্টের পাশে বিস্তারিত ভিউও দেখানো যেতে পারে।
MediaQuery থেকে Orientation পাওয়ার উপায়:
Dart

final Orientation orientation = MediaQuery.of(context).orientation;
if (orientation == Orientation.portrait) {
  // Portrait মোডের জন্য UI দেখাও
} else {
  // Landscape মোডের জন্য UI দেখাও
}
Breakpoints (ব্রেকপয়েন্ট)
Breakpoint হলো একটি নির্দিষ্ট প্রস্থের সীমা যা দিয়ে আমরা বিভিন্ন ধরনের ডিভাইসকে আলাদা করি। এটি রেসপন্সিভ ডিজাইনের মূল ভিত্তি। আমরা কিছু শর্ত (if-else) দিয়ে বলে দিই যে, স্ক্রিনের প্রস্থ যদি একটি নির্দিষ্ট সীমার (breakpoint) চেয়ে কম বা বেশি হয়, তাহলে UI কেমন দেখাবে।

সাধারণত, Material Design বা অন্যান্য ডিজাইন সিস্টেম অনুযায়ী কিছু стандарт ব্রেকপয়েন্ট ব্যবহার করা হয়:

Mobile (মোবাইল): < 600px
Tablet (ট্যাবলেট): 600px - 840px
Desktop (ডেস্কটপ): > 840px
এই ব্রেকপয়েন্টগুলো ব্যবহার করে তুমি পুরো অ্যাপের জন্য একটি রেসপন্সিভ লেআউট কাঠামো তৈরি করতে পারো। যেমন:
মোবাইলে: একটি ListView দেখানো হবে।
ট্যাবলেটে: একটি GridView দেখানো হবে যার প্রতি সারিতে আইটেম বেশি থাকবে।
ডেস্কটপে: বাম দিকে একটি Navigation Rail এবং ডান দিকে মূল কনটেন্ট দেখানো হবে।
MediaQuery এবং ব্রেকপয়েন্ট ব্যবহার:

Dart

final double screenWidth = MediaQuery.of(context).size.width;

if (screenWidth < 600) {
  // মোবাইল লেআউট
} else if (screenWidth < 840) {
  // ট্যাবলেট লেআউট
} else {
  // ডেস্কটপ লেআউট
}
 */

//Practice Task 6.39 — MediaQuery Advanced Ans Submitted
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MdaQu extends StatelessWidget {
  const MdaQu({super.key});
  final List<Map<String, dynamic>> products = const [
    {'icon': Icons.phone_android, 'name': 'Smartphone', 'price': 12000},
    {'icon': Icons.laptop, 'name': 'Laptop', 'price': 55000},
    {'icon': Icons.watch, 'name': 'Smart Watch', 'price': 3500},
    {'icon': Icons.headphones, 'name': 'Headphones', 'price': 2200},
    {'icon': Icons.tv, 'name': 'LED TV', 'price': 40000},
  ];
  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(title: const Text("MediaQuery Example")),
      body: Column(
        children: [
          Expanded(
              child: orientation == Orientation.portrait ? buildPotr() : buildLands(),

          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              orientation == Orientation.portrait ? 'Portrait' : 'Landscape',
            ),
          )

        ],
      ),
    );
  }
//Portrait
  Widget buildPotr(){
    return ListView.builder(
      itemCount: products.length,
        itemBuilder: (context,index){
          final product = products[index];
          return GestureDetector(
            onTap:()=> mysnk("Selected Product: ${product['name']} ", context),
            child: ListTile(
              leading: Icon(product['icon']),
              title: Text(product['name']),
              subtitle: Text('৳${product['price']}'),
            ),
          );

        }
    );
  }

  //Landscape
Widget buildLands(){
    return GridView.builder(
      itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
        ),
        itemBuilder: (context,index){
          final product = products[index];
          return GestureDetector(
            onTap:()=> mysnk("Selected Product: ${product['name']} ", context),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(product['icon'],size: 40, color: Colors.blue,),
                  SizedBox(height: 10,),
                  Text(product['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('৳${product['price']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                ],

              ),
            ),
          );

        }
    );
}

}

//////////////////////////////////////////////////////////
//Practice Task 6.39 — MediaQuery Advanced Ans Submitted Gmini

class ParentMdq extends StatelessWidget {
  const ParentMdq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQuery Example"),
      ),
      body: MdqaPtGmni(),

    );
  }
}

class MdqaPtGmni extends StatelessWidget {
  const MdqaPtGmni({super.key});

  final List<Map<String, dynamic>> products = const [
    {'icon': Icons.phone_android, 'name': 'Smartphone', 'price': 12000},
    {'icon': Icons.laptop, 'name': 'Laptop', 'price': 55000},
    {'icon': Icons.watch, 'name': 'Smart Watch', 'price': 3500},
    {'icon': Icons.headphones, 'name': 'Headphones', 'price': 2200},
    {'icon': Icons.tv, 'name': 'LED TV', 'price': 40000},
  ];
  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final double screenWidth = MediaQuery.of(context).size.width;

    if(orientation == Orientation.portrait){
      return buildPotsGrd1();
    }
    else{
      if(screenWidth<600){
        return buildLand6sGrd2();
      }else{
        return buildLand6UsGrd3();
      }
    }


  }

//PotGrid1
  Widget buildPotsGrd1(){
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context,index){
          final product = products[index];
          return GestureDetector(
            onTap:()=> mysnk("Selected Product: ${product['name']} ", context),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(product['icon'],size: 40, color: Colors.blue,),
                  SizedBox(height: 10,),
                  Text(product['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('৳${product['price']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                ],

              ),
            ),
          );

        }
    );
  }

  //Lands600Grid1
  Widget buildLand6sGrd2(){
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context,index){
          final product = products[index];
          return GestureDetector(
            onTap:()=> mysnk("Selected Product: ${product['name']} ", context),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(product['icon'],size: 40, color: Colors.blue,),
                  SizedBox(height: 10,),
                  Text(product['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('৳${product['price']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                ],

              ),
            ),
          );

        }
    );
  }


  //Lands600Grid1
  Widget buildLand6UsGrd3(){
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context,index){
          final product = products[index];
          return GestureDetector(
            onTap:()=> mysnk("Selected Product: ${product['name']} ", context),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(product['icon'],size: 40, color: Colors.blue,),
                  SizedBox(height: 10,),
                  Text(product['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('৳${product['price']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                ],

              ),
            ),
          );

        }
    );
  }
}
////////////////////////////////////////////////////////
//Practice Task 6.39 — Updated উন্নত ও কম কোড

class ParentMdqUpdated extends StatelessWidget {
  const ParentMdqUpdated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQuery Example"),
      ),
      body: MdqaPtGmniUpdted(),

    );
  }
}

class MdqaPtGmniUpdted extends StatelessWidget {
  const MdqaPtGmniUpdted({super.key});

  final List<Map<String, dynamic>> products = const [
    {'icon': Icons.phone_android, 'name': 'Smartphone', 'price': 12000},
    {'icon': Icons.laptop, 'name': 'Laptop', 'price': 55000},
    {'icon': Icons.watch, 'name': 'Smart Watch', 'price': 3500},
    {'icon': Icons.headphones, 'name': 'Headphones', 'price': 2200},
    {'icon': Icons.tv, 'name': 'LED TV', 'price': 40000},
  ];
  mysnk(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if(orientation == Orientation.portrait){
      crossAxisCount = 2;
    }
    else{
      if(screenWidth<600){
        crossAxisCount = 3;
      }else{
        crossAxisCount = 4;
      }
    }
    return GridViewFnPtLd(crossAxisCount);


  }

//GridViewFn
  Widget GridViewFnPtLd(int crossAxisCount){
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context,index){
          final product = products[index];
          return GestureDetector(
            onTap:()=> mysnk("Selected Product: ${product['name']} ", context),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(product['icon'],size: 40, color: Colors.blue,),
                  SizedBox(height: 10,),
                  Text(product['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text('৳${product['price']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),

                ],

              ),
            ),
          );

        }
    );
  }

}
