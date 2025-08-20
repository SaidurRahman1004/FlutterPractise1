import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
SliverAppBar কি?

SliverAppBar হলো এমন একটি AppBar যেটা স্ক্রল করলে:
Collapse (ছোট হয়ে যায়)
Expand (বড় হয়)
Pinned (উপরে আটকে থাকে)
Floaing (স্ক্রল আপ করলে সাথে সাথে দেখা যায়)
📱 যেখানে বেশি ব্যবহার হয়:
ই-কমার্স প্রোডাক্ট লিস্ট
সোশ্যাল মিডিয়া ফিড
নিউজ ফিড অ্যাপ
ইমেজ ব্যানার সহ স্ক্রলিং UI

🛠️ SliverAppBar এর প্রধান ফিচার:

expandedHeight → কতটুকু লম্বা হয়ে expand হবে।
pinned → true করলে উপরে collapse হয়ে AppBar সবসময় থাকবে।
floating → true করলে scroll উপরে টানলে AppBar সাথে সাথে show হবে।
flexibleSpace → এখানে আমরা cover image, title বা background widget দিতে পারি।

CustomScrollView কি?

CustomScrollView হলো এমন একটি Scroll View যেখানে একাধিক Sliver Widgets যোগ করা যায়।
Sliver মানে scrollable area এর একটি অংশ।
SliverAppBar এবং SliverList দুটোই Sliver এর উদাহরণ।

SliverAppBar এর গুরুত্বপূর্ণ প্রপার্টি
Property	কাজ

expandedHeight: App Bar-টি যখন পুরোপুরি প্রসারিত (expanded) থাকবে, তখন তার উচ্চতা কত হবে।
flexibleSpace: এই জায়গাটিই মূলত সংকুচিত (collapse) হয়। এখানে সাধারণত FlexibleSpaceBar উইজেট ব্যবহার করে একটি الخلفية ছবি বা অ্যানিমেশন রাখা হয়। FlexibleSpaceBar-এর title প্রোপার্টিতে দেওয়া টেক্সট App Bar সংকুচিত হওয়ার সাথে সাথে সুন্দরভাবে ছোট হয়ে নির্দিষ্ট জায়গায় বসে যায়।
pinned: যদি true করা হয়, তাহলে App Bar-টি পুরোপুরি সংকুচিত হওয়ার পরেও একটি ছোট অংশ স্ক্রিনের উপরে আটকে (pin) থাকবে।
floating: যদি true হয়, ব্যবহারকারী লিস্টের মাঝে থাকা অবস্থায় একটুখানি উপরের দিকে স্ক্রোল করা শুরু করলেই App Bar-টি ভেসে (float) উঠবে।
snap: এটি floating: true-এর সাথে কাজ করে। যদি true থাকে, তাহলে ভেসে ওঠা App Bar-টি একটুখানি দেখা গেলেই "স্ন্যাপ" করে পুরোপুরি দৃশ্যমান হয়ে যাবে।

CustomScrollView কী?
CustomScrollView হলো সেই ক্যানভাস বা পাত্র যেখানে তুমি বিভিন্ন ধরনের Sliver-কে একসাথে রাখতে পারো। এর children প্রোপার্টি নেই, এর বদলে আছে slivers প্রোপার্টি, যেখানে একটি List<Widget> (যারা Sliver) দিতে হয়।


UI কাঠামো (Tree Structure)

Scaffold
 └── body: CustomScrollView
       ├── SliverAppBar
       │     ├── expandedHeight: 200
       │     ├── pinned: true
       │     └── flexibleSpace: FlexibleSpaceBar
       │           ├── title: Text("SliverAppBar Example")
       │           └── background: Image.network(...)
       │
       ├── SliverList
       │     └── delegate: SliverChildBuilderDelegate
       │           ├── ListTile(title: "Item 0")
       │           ├── ListTile(title: "Item 1")
       │           ├── ListTile(title: "Item 2")
       │           └── ...
       │
       └── SliverGrid (Optional)
             └── delegate: SliverChildBuilderDelegate
                   ├── Container(child: Text("Grid 0"))
                   ├── Container(child: Text("Grid 1"))
                   ├── ...

ভিজুয়াল UI প্রিভিউ (Diagram)
 -----------------------------------------
|   📷  (Expanded AppBar Image)           |
|   SliverAppBar Title                    |
 -----------------------------------------
| Item 0                                  |
------------------------------------------
| Item 1                                  |
------------------------------------------
| Item 2                                  |
------------------------------------------
| ...                                     |
------------------------------------------
| [Grid Box 1]   [Grid Box 2]             |
------------------------------------------
| [Grid Box 3]   [Grid Box 4]             |
------------------------------------------

 */

///Practice Task 6.33: SliverAppBar & CustomScrollView Ans:

class SliverAppBarTask extends StatelessWidget {
  SliverAppBarTask({super.key});

  List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'price': 1200.50, 'icon': Icons.laptop_mac},
    {'name': 'Smartphone', 'price': 800.00, 'icon': Icons.smartphone},
    {'name': 'Headphones', 'price': 150.75, 'icon': Icons.headphones},
    {'name': 'Mouse', 'price': 25.00, 'icon': Icons.mouse},
    {'name': 'Keyboard', 'price': 75.50, 'icon': Icons.keyboard},
    {'name': 'Monitor', 'price': 300.00, 'icon': Icons.monitor},
    {'name': 'Webcam', 'price': 50.25, 'icon': Icons.camera_alt},
    {'name': 'Printer', 'price': 200.00, 'icon': Icons.print},
    {'name': 'Router', 'price': 60.00, 'icon': Icons.router},
    {'name': 'External Hard Drive', 'price': 120.00, 'icon': Icons.save},
    {'name': 'USB Cable', 'price': 10.00, 'icon': Icons.cable},
    {'name': 'Power Bank', 'price': 45.50, 'icon': Icons.power},
    {'name': 'Speaker', 'price': 90.00, 'icon': Icons.speaker},
    {'name': 'Desk Chair', 'price': 250.00, 'icon': Icons.chair},
    {'name': 'Coffee Maker', 'price': 65.20, 'icon': Icons.coffee_maker},
  ];

  SnnkB(masg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(masg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "SliverBar Products",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    shadows: <Shadow>[
                      // শ্যাডো যোগ করার জন্য
                      Shadow(
                        offset: Offset(1.0, 1.0), // শ্যাডোর X এবং Y অফসেট
                        blurRadius: 3.0, // শ্যাডোর ব্লার কেমন হবে
                        color: Color.fromARGB(
                          150,
                          0,
                          0,
                          0,
                        ), // শ্যাডোর রঙ (এখানে হালকা কালো)
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(
                          125,
                          0,
                          0,
                          255,
                        ), // উদাহরণস্বরূপ অন্য রঙের শ্যাডো
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                background: Image.network(
                  "https://plus.unsplash.com/premium_photo-1684471006753-9936b2bc7cdb?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  leading: Icon(products[index]['icon']),
                  title: Text(products[index]['name']),
                  subtitle: Text(
                    products[index]['price'].toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () => SnnkB("${products[index]['name']}", context),
                ),
                childCount: products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Ai Example
/*
class SilverE extends StatelessWidget {
  const SilverE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("My App"),
                  background: Image.network(
                    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(title: Text("Item ${index+1}")),
                  childCount: 20,
                ),
              ),
            ],
          )
        ,
      ),
    );
  }
}
*/

///Another

class SliverAppBarExample extends StatelessWidget {
  // একটি StatelessWidget তৈরি করা হয়েছে SliverAppBarExample নামে।
  const SliverAppBarExample({
    super.key,
  }); // কনস্ট্রাক্টর, key প্যারামিটারটি সুপার ক্লাসে পাঠানো হয়েছে।

  @override
  Widget build(BuildContext context) {
    // UI তৈরি করার জন্য build মেথড।
    return Scaffold(
      // একটি Scaffold widget রিটার্ন করা হয়েছে, যা অ্যাপের বেসিক স্ট্রাকচার তৈরি করে।
      body: CustomScrollView(
        // CustomScrollView ব্যবহার করা হয়েছে কাস্টম স্ক্রোল ইফেক্ট এর জন্য।
        slivers: [
          // slivers প্রোপার্টিতে বিভিন্ন sliver widget এর লিস্ট দেওয়া হয়েছে।
          SliverAppBar(
            // একটি SliverAppBar তৈরি করা হয়েছে, যা স্ক্রোল করার সাথে সাথে পরিবর্তিত হতে পারে।
            expandedHeight: 200,
            // AppBar যখন সম্পূর্ণ প্রসারিত থাকবে, তখন তার উচ্চতা হবে 200 পিক্সেল।
            pinned: true,
            // true সেট করা হয়েছে, এর মানে AppBar স্ক্রোল করার সময় উপরে পিন হয়ে থাকবে।
            floating: false,
            // false সেট করা হয়েছে, এর মানে AppBar স্ক্রোল করার সাথে সাথে অদৃশ্য হবে না, শুধুমাত্র সংকুচিত হবে।
            backgroundColor: Colors.deepPurple,
            // AppBar এর الخلفية রঙ ডিপ পার্পল সেট করা হয়েছে।
            flexibleSpace: FlexibleSpaceBar(
              // AppBar এর flexibleSpace প্রোপার্টিতে FlexibleSpaceBar ব্যবহার করা হয়েছে।
              title: const Text("SliverAppBar Demo"),
              // AppBar এর টাইটেল "SliverAppBar Demo" সেট করা হয়েছে।
              background: Image.network(
                // AppBar এর الخلفيةতে একটি নেটওয়ার্ক ইমেজ লোড করা হয়েছে।
                "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
                // ইমেজের URL।
                fit: BoxFit.cover, // ইমেজটি AppBar এর الخلفيةতে cover করবে।
              ),
            ),
          ),

          // Scrollable List
          SliverList(
            // একটি স্ক্রোলযোগ্য লিস্ট তৈরি করা হয়েছে।
            delegate: SliverChildBuilderDelegate(
              // লিস্টের আইটেমগুলো তৈরি করার জন্য SliverChildBuilderDelegate ব্যবহার করা হয়েছে।
              (context, index) => ListTile(
                // প্রতিটি আইটেমের জন্য একটি ListTile তৈরি করা হয়েছে।
                leading: CircleAvatar(child: Text("${index + 1}")),
                // ListTile এর শুরুতে একটি সার্কেল অবতার, যেখানে আইটেমের নম্বর দেখানো হচ্ছে।
                title: Text(
                  "Item ${index + 1}",
                ), // ListTile এর টাইটেল, যেখানে "Item" এবং আইটেমের নম্বর দেখানো হচ্ছে।
              ),
              childCount: 20, // লিস্টে মোট ২০টি আইটেম থাকবে।
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////📌 Practice Task 6.36 Recap//////////////////////////////
//6.36 — SliverAppBar & CustomScrollView (Collapsing Toolbar) Ans Submit
class sliversSubmit extends StatefulWidget {
  const sliversSubmit({super.key});

  @override
  State<sliversSubmit> createState() => _sliversSubmitState();
}

class _sliversSubmitState extends State<sliversSubmit> {
  List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'price': 1200.50, 'icon': Icons.laptop_mac},
    {'name': 'Smartphone', 'price': 800.00, 'icon': Icons.smartphone},
    {'name': 'Headphones', 'price': 150.75, 'icon': Icons.headphones},
    {'name': 'Mouse', 'price': 25.00, 'icon': Icons.mouse},
    {'name': 'Keyboard', 'price': 75.50, 'icon': Icons.keyboard},
    {'name': 'Monitor', 'price': 300.00, 'icon': Icons.monitor},
    {'name': 'Webcam', 'price': 50.25, 'icon': Icons.camera_alt},
    {'name': 'Printer', 'price': 200.00, 'icon': Icons.print},
    {'name': 'Router', 'price': 60.00, 'icon': Icons.router},
    {'name': 'External Hard Drive', 'price': 120.00, 'icon': Icons.save},
    {'name': 'USB Cable', 'price': 10.00, 'icon': Icons.cable},
    {'name': 'Power Bank', 'price': 45.50, 'icon': Icons.power},
    {'name': 'Speaker', 'price': 90.00, 'icon': Icons.speaker},
    {'name': 'Desk Chair', 'price': 250.00, 'icon': Icons.chair},
    {'name': 'Coffee Maker', 'price': 65.20, 'icon': Icons.coffee_maker},
  ];

  SnnkB(masg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(masg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product LIst")),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "My Awesome Blog Post",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              centerTitle: true,
              background: Image.network(
                "https://plus.unsplash.com/premium_photo-1673177667569-e3321a8d8256?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: Icon(products[index]['icon']),
                title: Text(products[index]['name']),
                trailing: Text(
                  "\$${products[index]['price']}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () =>
                    SnnkB("Selected: ${products[index]['name']}", context),
              ),
              childCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////

