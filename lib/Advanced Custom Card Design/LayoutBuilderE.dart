
/*
LayoutBuilder (রেসপন্সিভ UI) 📱 💻
১. তত্ত্ব (Explanation)
Responsive Design কী?
রেসপন্সিভ ডিজাইন মানে হলো এমন একটি ডিজাইন তৈরি করা যা যেকোনো ডিভাইসের স্ক্রিনের আকারের সাথে নিজেকে মানিয়ে নিতে পারে। তোমার বানানো অ্যাপটি ছোটো ফোনে যেমন সুন্দর দেখাবে, বড় ট্যাবলেট বা এমনকি ডেস্কটপেও তেমনই সুন্দর এবং ব্যবহারযোগ্য থাকবে। UI ভেঙে যাবে না বা অদ্ভুত দেখাবে না।

MediaQuery বনাম LayoutBuilder
আমরা অনেক সময় স্ক্রিনের আকার জানার জন্য MediaQuery.of(context).size ব্যবহার করি। এটি আমাদের সম্পূর্ণ স্ক্রিনের প্রস্থ (width) এবং উচ্চতা (height) দেয়। এটি গ্লোবাল লেআউটের জন্য ভালো।
কিন্তু যদি এমন হয় যে, তোমার উইজেটটি পুরো স্ক্রিন জুড়ে নেই? ধরো, একটি ট্যাবলেটে স্ক্রিনের বাম দিকে একটি লিস্ট এবং ডান দিকে বিস্তারিত ভিউ আছে। এক্ষেত্রে ডান দিকের উইজেটটি কিন্তু পুরো স্ক্রিনের প্রস্থ পায়নি, সে তার প্যারেন্ট উইজেটের দেওয়া জায়গাটুকুই পেয়েছে।
এইরকম পরিস্থিতিতে, একটি উইজেট তার নিজের জন্য কতটুকু জায়গা বরাদ্দ পেয়েছে তা জানার জন্য MediaQuery সঠিক তথ্য দিতে পারে না। এখানেই কাজে আসে LayoutBuilder।
LayoutBuilder কী
LayoutBuilder হলো এমন একটি বিশেষ উইজেট যা তার চাইল্ডকে রেন্ডার করার আগে তার প্যারেন্ট উইজেটের কাছ থেকে পাওয়া সীমাবদ্ধতা বা constraints সম্পর্কে তথ্য দেয়।
সহজ কথায়, LayoutBuilder তার চাইল্ডকে বলে দেয়, "তোমাকে আঁকার জন্য সর্বোচ্চ এতটুকু চওড়া এবং এতটুকু লম্বা জায়গা দেওয়া হয়েছে।"
LayoutBuilder একটি builder ফাংশন গ্রহণ করে, যার দুটি প্যারামিটার থাকে:
BuildContext context: नेहमीকার মত context।
BoxConstraints constraints: এটাই মূল জিনিস! এটি একটি অবজেক্ট যাতে ওই উইজেটের জন্য উপলব্ধ সর্বোচ্চ ও সর্বনিম্ন প্রস্থ (maxWidth, minWidth) এবং উচ্চতা (maxHeight, minHeight) এর তথ্য থাকে।
BoxConstraints অবজেক্টের সাহায্যে তুমি শর্ত (if-else) যোগ করে বলে দিতে পারো যে, নির্দিষ্ট পরিমাণ জায়গা পেলে UI কেমন হবে।

সাধারণ ব্যবহার:


LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth > 600) {
      // যদি প্রস্থ 600 এর বেশি হয় (ট্যাবলেটের মতো)
      return buildWideLayout();
    } else {
      // যদি প্রস্থ 600 এর কম হয় (ফোনের মতো)
      return buildNarrowLayout();
    }
  },
)
উইজেট ট্রি (Widget Tree) ডায়াগ্রাম:
ParentWidget (e.g., Container)
└── LayoutBuilder
    └── builder: (context, constraints) =>
        ├── if (constraints.maxWidth is large)
        │   └── Return WideLayout (e.g., Row)
        └── else
            └── Return NarrowLayout (e.g., Column)
 */
//Practice Task 6.38 — LayoutBuilder (Responsive) Ans Submit:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutBuilderExample extends StatelessWidget {
  ResponsiveLayoutBuilderExample({super.key});

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce Products \n Screen Size width:  ${size.width} & height: ${size.height}'),
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () => mysnk('Selected ${product['name']}', context),
                  child: ListTile(
                    leading: Icon(product['icon']),
                    title: Text(product['name']),
                    subtitle: Text('৳${product['price']}'),
                  ),
                );
              },
            );
          }
          else{
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
                  return InkWell(
                    onTap: () => mysnk('Selected ${product['name']}', context),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(product['icon'],size: 40, color: Colors.blue),
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
        },
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////
////Practice Task 6.38 — LayoutBuilder Gmni Ans:
class ResponsiveContactCard extends StatelessWidget {
  const ResponsiveContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Card"),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
                builder: (context,constraints){
                  if(constraints.maxWidth < 300){
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage("https://i.postimg.cc/bNZdjVSY/o1.jpg",),
                          ),
                          SizedBox(height: 10,),
                          Text("Sr Sheam",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Siyambn705@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                        ],

                      ),
                    );
                  }else{
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage("https://i.postimg.cc/bNZdjVSY/o1.jpg",),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sr Sheam",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text("Siyambn705@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                            ],

                          )



                        ],
                      ),
                    );
                  }
                }
            ),
          ),
        ),
      ),

    );
  }
}

