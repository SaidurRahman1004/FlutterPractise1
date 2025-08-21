/*
NestedScrollView + Tabs (Coordinated Scroll)
এটা হলো SliverAppBar + TabBar + Scrollable Content একসাথে ম্যানেজ করার সিস্টেম।

NestedScrollView কী?
এই সমন্বয়হীনতার সমাধানই হলো NestedScrollView।

NestedScrollView এমন একটি বিশেষ উইজেট যা একটি বাইরের স্ক্রোলযোগ্য এলাকা (যেমন SliverAppBar) এবং এক বা একাধিক ভেতরের স্ক্রোলযোগ্য এলাকাকে (যেমন TabBarView-এর ভেতরের লিস্ট) একসাথে সংযুক্ত করে। এর ফলে, তুমি যখন ভেতরের কোনো লিস্ট স্ক্রোল করবে, তখন বাইরের SliverAppBar-ও সেই অনুযায়ী সংকুচিত বা প্রসারিত হবে।
NestedScrollView-এর প্রধান অংশ:
headerSliverBuilder: এটি একটি ফাংশন যা বাইরের Sliver-গুলো (outer slivers) তৈরি করে। এখানে তুমি তোমার SliverAppBar এবং TabBar-কে রাখার জন্য SliverPersistentHeader-এর মতো উইজেটগুলো রাখবে।
body: এখানে তুমি তোমার ভেতরের স্ক্রোলযোগ্য উইজেটটি রাখবে, যা সাধারণত একটি TabBarView হয়।

Overlap (ওভারল্যাপ) সমস্যা এবং সমাধান
NestedScrollView ব্যবহার করলে একটি সাধারণ সমস্যা দেখা দেয়। যখন SliverAppBar পুরোপুরি সংকুচিত হয়ে যায়, তখন ভেতরের TabBarView-এর কনটেন্ট কিছুটা অংশ ওই সংকুচিত App Bar-এর নিচে চলে যায় (overlap)।

এই সমস্যা সমাধানের জন্য দুটি সহযোগী উইজেট ব্যবহার করতে হয়:
SliverOverlapAbsorber: এই উইজেটটিকে headerSliverBuilder-এর ভেতরে রাখতে হয়। এটি SliverAppBar দ্বারা দখল করা জায়গার পরিমাণ "শোষণ" (absorb) করে এবং NestedScrollView-কে সেই তথ্য দেয়।
SliverOverlapInjector: এই উইজেটটিকে TabBarView-এর প্রতিটি ট্যাবের ভেতরের স্ক্রোলযোগ্য লিস্টের শুরুতে রাখতে হয়। এটি শোষিত (absorbed) হওয়া জায়গাটিকে একটি প্যাডিং (padding) হিসেবে "প্রয়োগ" (inject) করে, যা লিস্টের কনটেন্টকে সঠিক জায়গায় নিচে নামিয়ে আনে।

উইজেট ট্রি (Widget Tree) ডায়াগ্রাম:

Scaffold
└── NestedScrollView
    ├── headerSliverBuilder: (context, innerBoxIsScrolled) => [
    │   ├── SliverOverlapAbsorber
    │   │   └── handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
    │   │   └── sliver: SliverAppBar(...)
    │   │
    │   └── SliverPersistentHeader(delegate: _SliverAppBarDelegate(TabBar(...)))
    │
    └── body: TabBarView
        ├── CustomScrollView
        │   └── slivers: [
        │       ├── SliverOverlapInjector(...), // Inject padding
        │       └── SliverList(...)
        │   ]
        └── CustomScrollView
            └── slivers: [
                ├── SliverOverlapInjector(...), // Inject padding
                └── SliverGrid(...)
            ]
            ...................................................................


            MaterialApp
 └── Scaffold
      └── NestedScrollView   <-- মূল widget
           ├── headerSliverBuilder (Slivers → SliverAppBar, SliverOverlapAbsorber)
           │     └── SliverAppBar
           │           ├── title
           │           ├── flexibleSpace (image, etc.)
           │           └── bottom: TabBar
           │
           └── body: TabBarView
                 ├── Tab 1 → CustomScrollView (List / SliverList)
                 └── Tab 2 → CustomScrollView (Grid / SliverGrid)


 */
//Practice Task 6.37 NestedScrollView + Tabs (Coordinated Scroll) Ans Submit
import 'package:flutter/material.dart';

class EcommerceNestedScroll extends StatelessWidget {
  const EcommerceNestedScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text("Ecommerce"),
                floating: true,
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://picsum.photos/200/300",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(text: "All Products"),
                    Tab(text: "Categories"),
                    Tab(text: "About"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [AllProductsTab(), CategoriesTabt(), AboutTab()],
          ),
        ),
      ),
    );
  }
}

class AllProductsTab extends StatelessWidget {
  const AllProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_bag, size: 40, color: Colors.blue),
              const SizedBox(height: 10),
              Text("Product ${index + 1}"),
            ],
          ),
        );
      },
    );
  }
}

//,,
class CategoriesTabt extends StatelessWidget {
  CategoriesTabt({super.key});

  final categories = [
    "Electronics",
    "Fashion",
    "Shoes",
    "Watches",
    "Home & Kitchen",
    "Sports",
    "Books",
    "Beauty",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: categories
            .map(
              (cat) => Chip(
                label: Text(cat),
                backgroundColor: Colors.blueGrey,
                avatar: Icon(Icons.category, color: Colors.blue),
              ),
            )
            .toList(),
      ),
    );
  }
}

//,,
class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Welcome to E-commerce Store!\n\n"
          "Here you can find a wide range of products including fashion, "
          "electronics, home essentials, and much more.\n\n"
          "Enjoy shopping with smooth experience!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

//Practice Task 6.37 NestedScrollView + Tabs (Coordinated Scroll) Ans Submit Gmini
class ResorebtMenue extends StatelessWidget {
  const ResorebtMenue({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver:               SliverAppBar(
                  title: Text(
                    "HiruVai Restora",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  floating: true,
                  pinned: true,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      "https://img.lovepik.com/photo/48025/8241.jpg_wh860.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Appetizers"),
                      Tab(text: "Main Course"),
                    ],
                  ),
                ),
              )

            ];
          },
          body: TabBarView(
            children: [AppiTabContent(), MainCourseMenuTabContent()],
          ),
        ),
      ),
    );
  }
}

//appetizers
class AppiTabContent extends StatelessWidget {
  AppiTabContent({super.key});

  List<Map<String, dynamic>> appetizers = [
    {
      "name": "Spring Rolls",
      "desc": "Crispy rolls with veggies",
      "icon": Icons.local_dining,
    },
    {
      "name": "Garlic Bread",
      "desc": "Toasted bread with garlic & butter",
      "icon": Icons.bakery_dining,
    },
    {
      "name": "Chicken Wings",
      "desc": "Spicy grilled wings",
      "icon": Icons.set_meal,
    },
    {
      "name": "French Fries",
      "desc": "Crispy potato fries",
      "icon": Icons.fastfood,
    },
    {
      "name": "Nachos",
      "desc": "Corn chips with cheese dip",
      "icon": Icons.lunch_dining,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    leading: Icon(appetizers[index]["icon"]),
                    title: Text(appetizers[index]["name"]),
                    subtitle: Text(appetizers[index]["desc"]),
                  ),
                  childCount: appetizers.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

//MainCourseMenu
class MainCourseMenuTabContent extends StatelessWidget {
  MainCourseMenuTabContent({super.key});

  List<Map<String, dynamic>> mainCourse = [
    {
      "name": "Grilled Chicken",
      "desc": "Served with mashed potatoes",
      "icon": Icons.set_meal,
    },
    {
      "name": "Beef Steak",
      "desc": "Juicy steak with pepper sauce",
      "icon": Icons.dinner_dining,
    },
    {
      "name": "Paneer Butter Masala",
      "desc": "Indian curry with soft paneer",
      "icon": Icons.rice_bowl,
    },
    {
      "name": "Fried Rice",
      "desc": "Veg/Chicken fried rice",
      "icon": Icons.local_dining,
    },
    {
      "name": "Pasta Alfredo",
      "desc": "Creamy white sauce pasta",
      "icon": Icons.lunch_dining,
    },
    {
      "name": "Fish Curry",
      "desc": "Traditional spicy curry with rice",
      "icon": Icons.restaurant_menu,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(mainCourse[index]["icon"], size: 40, color: Colors.blue),
                          SizedBox(height: 10),
                          Text(mainCourse[index]["name"]),
                          SizedBox(height: 5),
                          Text(mainCourse[index]["desc"],style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          ),maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                    childCount: mainCourse.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
