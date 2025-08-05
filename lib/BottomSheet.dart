import 'package:flutter/material.dart';
/*
BottomSheet হলো এমন একটি UI component যা স্ক্রিনের নিচ থেকে উপরে স্লাইড করে আসে এবং ইউজারকে কোনো information দেখাতে বা action নিতে সাহায্য করে।
| প্রকার                   | ব্যাখ্যা                                                                          |
| ------------------------ | --------------------------------------------------------------------------------- |
| `Modal BottomSheet`      | Screen-এর নিচ থেকে আসে, বাকি UI ব্লার করে। ইউজার বাইরে ট্যাপ করলে এটি dismiss হয়। |
| `Persistent BottomSheet` | AppBar এর নিচে আসে, dismiss হয় না যতক্ষণ না আমরা নিজে হ্যান্ডল করি।               |


| বিষয়                                       | ব্যাখ্যা                                             |
| ------------------------------------------ | ---------------------------------------------------- |
| `showModalBottomSheet`                     | BottomSheet ওপেন করার জন্য Flutter এর বিল্ট-ইন ফাংশন |
| `onSubmit`                                 | Callback ফাংশন যা Sheet থেকে Parent-এ ডাটা পাঠায়     |
| `MediaQuery.of(context).viewInsets.bottom` | Keyboard ওপেন থাকলে Bottom padding handle করে        |
| `TextEditingController`                    | ইনপুট field এর ভ্যালু কন্ট্রোল করার জন্য             |


 */
////Copyed BottomSheet
/*
import 'package:flutter/material.dart';

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({super.key});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  String userName = "Not set";

  // Function to Show BottomSheet
  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // full height if needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => CustomBottomSheet(
        onSubmit: (value) {
          setState(() {
            userName = value;
          });
          Navigator.pop(context); // Close the sheet
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomSheet Full Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User Name: $userName", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => openBottomSheet(context),
              child: Text("Open BottomSheet"),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔻 Custom BottomSheet UI
class CustomBottomSheet extends StatelessWidget {
  final Function(String) onSubmit;

  CustomBottomSheet({required this.onSubmit});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // shrink the sheet
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter Your Name", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Ex: Saidur",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String name = nameController.text.trim();
              if (name.isNotEmpty) {
                onSubmit(name); // Pass value to parent
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please enter a name")),
                );
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}


 */
/*
////Step 6.20 Practice Task Ans : BottomSheet – Full Custom UI + Function Passing + Dynamic Design
class ButtomSheetCustom extends StatefulWidget {               // একটি StatefulWidget তৈরি করা হচ্ছে, কারণ UI-এর ডেটা পরিবর্তন হবে।
  const ButtomSheetCustom({super.key});

  @override
  State<ButtomSheetCustom> createState() => _ButtomSheetCustomState();
}

class _ButtomSheetCustomState extends State<ButtomSheetCustom> {
  String ShowItem = "";                                   // একটি ভ্যারিয়েবল যা স্ক্রিনে নির্বাচিত আইটেম দেখানোর জন্য ব্যবহৃত হবে।
  snkbtn(msg,context){                                          // একটি ফাংশন যা একটি SnackBar (ছোট মেসেজ) দেখানোর জন্য তৈরি।
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  //List
  List<String> Products = ["Mobile","Laptop","Tablet"];         // একটি লিস্ট যা BottomSheet-এ দেখানো আইটেমগুলো ধারণ করে।

  // Function to Show BottomSheet
  void openBottomSheetCustom(BuildContext context){             // মূল ফাংশন যা BottomSheet দেখানোর কাজটি করে।
    showModalBottomSheet(                                     // ফ্লাটারের বিল্ট-ইন ফাংশন যা BottomSheet পপ-আপ করে।
        context: context,
        isScrollControlled: true,                               // BottomSheet-কে প্রয়োজনে স্ক্রিনের অর্ধেকের বেশি জায়গা নিতে দেয়।
        shape: RoundedRectangleBorder(                          // BottomSheet-এর উপরের কোণাগুলো গোলাকার করার জন্য।
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context){                                     // এই ফাংশনটি BottomSheet-এর ভেতরের UI তৈরি করে।
          return Container(                                     // BottomSheet-এর কনটেন্ট রাখার জন্য কন্টেইনার।
            padding: EdgeInsets.all(20),
            height: 300,
            color: Colors.amberAccent,
            child: ListView.builder(                            // Products লিস্ট থেকে আইটেমগুলো দেখানোর জন্য একটি লিস্টভিউ।
                itemCount: Products.length,                     // লিস্টভিউকে বলে দেওয়া হচ্ছে মোট কয়টি আইটেম তৈরি করতে হবে।
                itemBuilder: (context,index){                   // প্রতিটি আইটেম দেখতে কেমন হবে তা এখানে তৈরি করা হয়।
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.label),
                      title: Text(Products[index]),               // লিস্ট থেকে একটি করে প্রোডাক্টের নাম এখানে দেখানো হচ্ছে।
                      onTap: (){                                  // লিস্টের কোনো আইটেমে ট্যাপ করা হলে এই কোডটি রান করবে।
                        setState(() {                             // ফ্লাটারকে জানানো হচ্ছে যে State পরিবর্তন হয়েছে এবং UI রিবিল্ড করতে হবে।
                          ShowItem = Products[index];             // নির্বাচিত আইটেমের নাম ShowItem ভ্যারিয়েবলে রাখা হচ্ছে।
                          snkbtn("You Selected ${Products[index]}", context); // কোন আইটেম সিলেক্ট করা হলো তা SnackBar-এর মাধ্যমে দেখানো হচ্ছে।
                          Navigator.pop(context);                 // আইটেম সিলেক্ট করার পর BottomSheet-টিকে বন্ধ করে দেওয়া হচ্ছে।
                        });
                      },
                    ),
                  );

                }
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {                           // এই উইজেটের মূল UI এখানে তৈরি করা হচ্ছে।
    return Scaffold(
      appBar: AppBar(title: Text("BottomSheetPractise..."),backgroundColor: Colors.amber,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Product is $ShowItem",style: TextStyle(fontSize: 24)), // নির্বাচিত পণ্যের নাম এখানে দেখানো হচ্ছে।
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){openBottomSheetCustom(context);}, child: Text("Submit")), // এই বাটনে চাপ দিলে BottomSheet ওপেন হবে।
          ],
        ),
      ),
    );
  }
}
 */
////Step 6.20 Practice Task Ans : BottomSheet – Full Custom UI + Function Passing + Dynamic Design
class ButtomSheetCustom extends StatefulWidget {
  const ButtomSheetCustom({super.key});

  @override
  State<ButtomSheetCustom> createState() => _ButtomSheetCustomState();
}

class _ButtomSheetCustomState extends State<ButtomSheetCustom> {
  String ShowItem = "Your Product is ";
  snkbtn(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
  //List
  List<Map<String, dynamic>> Products = [
    {"name": "Mobile", "icon": Icons.mobile_friendly},
    {"name": "Laptop", "icon": Icons.laptop_mac},
    {"name": "Tablet", "icon": Icons.tablet_mac},
  ];
  // Function to Show BottomSheet
  void openBottomSheetCustom(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context){
          return Container(
            padding: EdgeInsets.all(10),
            height: 200,
            color: Colors.amberAccent,
            child: ListView.builder(
                itemCount: Products.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: Icon(Products[index]["icon"]),
                      title: Text(Products[index]["name"]),
                      onTap: (){
                        setState(() {
                          ShowItem = Products[index]["name"];
                          snkbtn("You Selected ${Products[index]}", context);
                          Navigator.pop(context);
                        });
                      },
                    ),
                  );

                }
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomSheetPractise..."),backgroundColor: Colors.amber,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Product is $ShowItem",style: TextStyle(fontSize: 24)),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){openBottomSheetCustom(context);}, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
