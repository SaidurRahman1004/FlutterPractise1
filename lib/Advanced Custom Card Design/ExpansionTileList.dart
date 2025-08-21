import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
1️⃣ ExpansionTile কী?

ExpansionTile Flutter এর একটা বিল্ট-ইন উইজেট যেটা একটা লিস্ট আইটেমকে ট্যাপ করলে খুলে যায় (expand হয়) আর ভেতরে আরও কন্টেন্ট দেখায়।
এটাকে তুমি Accordion View ও বলতে পারো।

📌 Key Features:
শিরোনাম (title)
সাব-শিরোনাম (subtitle) (optional)
শুরুতে আইকন বা ছবি (leading)
ডান পাশে expand/collapse arrow
expand হলে ভেতরে children widgets দেখানো যায়
,,,,,,,,,,,,,,,,,,,,
2️⃣ বাস্তব উদাহরণ

ধরা যাক তোমার একটি FAQ App আছে।

প্রশ্ন: Flutter কী?
→ ইউজার ট্যাপ করলে উত্তর দেখাবে।

প্রশ্ন: Dart কীভাবে কাজ করে?
→ ট্যাপ করলে উত্তর দেখাবে।

এক্ষেত্রে প্রত্যেক প্রশ্ন হবে ExpansionTile এর title, আর উত্তর হবে এর children।
Widget Tree (ডায়াগ্রাম)
Scaffold
 └── AppBar
 └── ListView.builder
      └── ExpansionTile (for each contact)
           ├── leading: CircleAvatar
           ├── title: Text (Name)
           ├── subtitle: Text (Phone)
           └── children:
                ├── ListTile (Email)
                └── ListTile (Address)
বাস্তব ইউজকেস

FAQ Section (Question → Answer)
E-commerce Category (Category → Sub-category list)
Settings Menu (Parent Setting → Sub-settings)
Chat App (User → User details)

 */

///Practice Task 6.32: ExpansionTile & Custom Expandable List: Ans:
class ExpansionTileExample  extends StatelessWidget {
   ExpansionTileExample ({super.key});
  SnackBarCustom(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),duration: Duration(seconds: 1),));
  }

   final List<Map<String, dynamic>> catagoryItems = [
     {
       'icon': Icons.electrical_services,
       'name': 'Electronics',
     },
     {
       'icon': Icons.shopping_bag,
       'name': 'Fashion',
     },

     {
       'icon': Icons.home,
       'name': 'Home & Lifestyle',
     },
   ];



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("ExpansionTile ProductList "),backgroundColor: Colors.purple,),
      body: ListView(
          children: [
            ExpansionTile(
              leading: Icon(catagoryItems[0]['icon'],color: Colors.blue),
              title: Text(catagoryItems[0]['name'],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: [
                ListTile(title: Text("Smartphones"),onTap: (){SnackBarCustom("Smartphones", context);}),
                Divider(),
                ListTile(title: Text("Laptop"),onTap: (){SnackBarCustom("Laptop", context);}),
                Divider(),
                ListTile(title: Text("Cameras"),onTap: (){SnackBarCustom("Cameras", context);}),


              ],

            ),

            ExpansionTile(
              leading: Icon(catagoryItems[1]['icon'],color: Colors.blue),
              title: Text(catagoryItems[1]['name'],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: [
                ListTile(title: Text("Men's Wear"),onTap: (){SnackBarCustom("Men's Wear", context);}),
                Divider(),
                ListTile(title: Text("Women's Wear"),onTap: (){SnackBarCustom("Women's Wear", context);}),
                Divider(),
                ListTile(title: Text("Kids' Wear"),onTap: (){SnackBarCustom("Kids' Wear", context);}),


              ],

            ),

            ExpansionTile(
              leading: Icon(catagoryItems[2]['icon'],color: Colors.blue),
              title: Text(catagoryItems[2]['name'],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: [
                ListTile(title: Text("Furniture"),onTap: (){SnackBarCustom("Furniture", context);}),
                Divider(),
                ListTile(title: Text("Kitchenware"),onTap: (){SnackBarCustom("Kitchenware", context);}),
                Divider(),
                ListTile(title: Text("Home Decor"),onTap: (){SnackBarCustom("Home Decor", context);}),


              ],

            ),
          ],
      ),
    );
  }
}


///Better Way Using Loop
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
1️⃣ ExpansionTile কী?

ExpansionTile Flutter এর একটা বিল্ট-ইন উইজেট যেটা একটা লিস্ট আইটেমকে ট্যাপ করলে খুলে যায় (expand হয়) আর ভেতরে আরও কন্টেন্ট দেখায়।
এটাকে তুমি Accordion View ও বলতে পারো।

📌 Key Features:
শিরোনাম (title)
সাব-শিরোনাম (subtitle) (optional)
শুরুতে আইকন বা ছবি (leading)
ডান পাশে expand/collapse arrow
expand হলে ভেতরে children widgets দেখানো যায়
,,,,,,,,,,,,,,,,,,,,
2️⃣ বাস্তব উদাহরণ

ধরা যাক তোমার একটি FAQ App আছে।

প্রশ্ন: Flutter কী?
→ ইউজার ট্যাপ করলে উত্তর দেখাবে।

প্রশ্ন: Dart কীভাবে কাজ করে?
→ ট্যাপ করলে উত্তর দেখাবে।

এক্ষেত্রে প্রত্যেক প্রশ্ন হবে ExpansionTile এর title, আর উত্তর হবে এর children।
Widget Tree (ডায়াগ্রাম)
Scaffold
 └── AppBar
 └── ListView.builder
      └── ExpansionTile (for each contact)
           ├── leading: CircleAvatar
           ├── title: Text (Name)
           ├── subtitle: Text (Phone)
           └── children:
                ├── ListTile (Email)
                └── ListTile (Address)
বাস্তব ইউজকেস

FAQ Section (Question → Answer)
E-commerce Category (Category → Sub-category list)
Settings Menu (Parent Setting → Sub-settings)
Chat App (User → User details)

 */

///Practice Task 6.32: ExpansionTile & Custom Expandable List: Ans:
class ExpansionTileExample extends StatelessWidget {
  ExpansionTileExample({super.key});

  SnackBarCustom(String msg, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  // ডেটা স্ট্রাকচার পরিবর্তন করে সাব-আইটেম যোগ করা হয়েছে
  final List<Map<String, dynamic>> catagoryItems = [
    {
      'icon': Icons.electrical_services,
      'name': 'Electronics',
      'subItems': [
        {'title': 'Smartphones'},
        {'title': 'Cameras'},
        {'title': 'Laptops'},
      ],
    },
    {
      'icon': Icons.shopping_bag,
      'name': 'Fashion',
      'subItems': [
        {'title': 'Men\'s Wear'},
        {'title': 'Women\'s Wear'},
        {'title': 'Kids\' Wear'},
      ],
    },
    {
      'icon': Icons.home,
      'name': 'Home & Lifestyle',
      'subItems': [
        {'title': 'Furniture'},
        {'title': 'Kitchenware'},
        {'title': 'Home Decor'}, // "Laptops" এর পরিবর্তে "Home Decor" ব্যবহার করা হলো
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExpansionTile ProductList "),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: catagoryItems.length,
        itemBuilder: (context, index) {
          // itemBuilder থেকে একটি ExpansionTile রিটার্ন করতে হবে
          return ExpansionTile(
            leading: Icon(
              catagoryItems[index]['icon'],
              color: Colors.teal,
            ),
            title: Text(
              catagoryItems[index]['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            children: (catagoryItems[index]['subItems'] as List<Map<String, String>>)
                .map((subItem) {
              return ListTile(
                title: Text(subItem['title']!),
                onTap: () => SnackBarCustom(subItem['title']!, context),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

 */



class ExpansionTileOptimized extends StatelessWidget {
  ExpansionTileOptimized({super.key});

  // SnackBar Function
  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(seconds: 1)),
    );
  }

  // Data: Category List with Items
  final List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.electrical_services,
      'name': 'Electronics',
      'items': ['Smartphones', 'Laptop', 'Cameras']
    },
    {
      'icon': Icons.shopping_bag,
      'name': 'Fashion',
      'items': ["Men's Wear", "Women's Wear", "Kids' Wear"]
    },
    {
      'icon': Icons.home,
      'name': 'Home & Lifestyle',
      'items': ['Furniture', 'Kitchenware', 'Home Decor']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExpansionTile Product List"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, catIndex) {
          final category = categories[catIndex];
          return ExpansionTile(
            leading: Icon(category['icon'], color: Colors.blue),
            title: Text(
              category['name'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: List.generate(category['items'].length, (index) {
              final item = category['items'][index];
              return Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 72, right: 16),
                    title: Text(item),
                    onTap: () => showSnackBar(context, item),
                  ),
                  if (index != category['items'].length - 1) const Divider(),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
/*
কোডের পরিবর্তন ও উন্নতি

List<Map> দিয়ে Data Store — নতুন ক্যাটাগরি বা সাব-আইটেম অ্যাড করলে শুধু data list এ যোগ করতে হবে।

ListView.builder + ExpansionTile — লুপের মাধ্যমে ক্যাটাগরি তৈরি।

Padding Adjustment — Sub-item গুলো parent icon/title এর নিচে ইনডেন্টেড দেখাবে।

Dynamic Divider — শেষ সাব-আইটেমের পরে Divider আসবে না।

Consistent Icon Color — সব ক্যাটাগরির icon এর রঙ এক রাখা হয়েছে।
 */
class ExpenLExam extends StatelessWidget {
   ExpenLExam({super.key});
  final List<Map<String, dynamic>> Items = [
    {
      'icon': Icons.web,
      'name': 'Web',
      'items': ['HTML', 'CSS', 'JS']
    },
    {
      'icon': Icons.app_blocking,
      'name': 'App',
      'items': ["Dart", "Kotlin", "Java","ReactJs"]
    },
    {
      'icon': Icons.air,
      'name': 'Ai',
      'items': ['python', 'Math', 'BlockChain']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpansionTile ProductList "),backgroundColor: Colors.purple,),
      body: ListView.builder(
        itemCount: Items.length,
          itemBuilder: (context,Itindex){
          final itm = Items[Itindex];
          return ExpansionTile(
            leading: Icon(itm['icon'],color: Colors.blue),
            title: Text(itm['name'],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            children: List.generate(itm['items'].length, (index){
              final ittem = itm['items'][index];
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 72,right: 16),
                    title:Text(ittem),
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ittem),duration: Duration(seconds: 1),));
                    },
                  ),
                  if (index != itm['items'].length - 1) const Divider()

                ],


              );

            }),

          );
          }
      )
    );
  }
}
