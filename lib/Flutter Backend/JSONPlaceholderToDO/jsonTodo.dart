import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//todo Model class
class todo {
  int userId;
  int id;
  String title;
  bool completed;

  todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory todo.fromJson(Map<String, dynamic> json) {
    return todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
//todo API call

Future<List<todo>> fetchTodoData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((Todo) => todo.fromJson(Todo)).toList();
  } else
    throw Exception('Failed to load todo');
}
////todo Ui
class todoUi extends StatelessWidget {
  const todoUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: todoHomeUI());
  }
}
//todo Ui HomeScreen
class todoHomeUI extends StatefulWidget {
  const todoHomeUI({super.key});

  @override
  State<todoHomeUI> createState() => _todoHomeUIState();
}

class _todoHomeUIState extends State<todoHomeUI> {
  late Future<List<todo>> futureTodo;

  @override
  void initState()  {
    super.initState();
    futureTodo = fetchTodoData();
  }
  mySnk(msg,context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg),
          duration: Duration(seconds: 4),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: FutureBuilder<List<todo>>(
        future: futureTodo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final todoData = snapshot.data;
            if(todoData!.isEmpty){
              return Text("No Data Found");
            }
            return ListView.builder(
              itemCount: todoData.length,
                itemBuilder: (context, index) {
                final TODOdata = todoData[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(TODOdata.title),
                    trailing: Checkbox(
                        value: TODOdata.completed ,
                        onChanged: (bool? Newvalue){
                          setState(() {
                            TODOdata.completed = Newvalue!;
                          });
                          mySnk('Checkbox for "${TODOdata.title}" changed to $Newvalue', context);
                        }
                    ),
                  ),
                );

            });
          } else {
            return Text("No Data Found");
          }
        },
      ),
    );
  }
}

////////////////////////////////////////////////////Explain/////////////////////////////////////

/*
 // Flutter-এর কোর ম্যাটেরিয়াল ডিজাইন কম্পোনেন্টগুলো ইম্পোর্ট করা হচ্ছে।
// UI তৈরি করার জন্য (যেমন MaterialApp, Scaffold, Text, ListView, Card, ListTile, Checkbox, CircularProgressIndicator) এগুলো প্রয়োজন।
import 'package:flutter/material.dart';

// HTTP রিকোয়েস্ট (যেমন GET, POST) পাঠানোর জন্য 'http' প্যাকেজ ইম্পোর্ট করা হচ্ছে।
// এটিকে 'http' নামে ব্যবহার করা হবে।
import 'package:http/http.dart' as http;

// JSON ডেটা এনকোড (Dart অবজেক্ট থেকে JSON স্ট্রিং) এবং ডিকোড (JSON স্ট্রিং থেকে Dart অবজেক্ট) করার জন্য
// 'dart:convert' লাইব্রেরি ইম্পোর্ট করা হচ্ছে।
import 'dart:convert';

// todo ডেটা মডেল করার জন্য একটি ক্লাস।
// এই ক্লাসটি API থেকে প্রাপ্ত প্রতিটি "todo" আইটেমের গঠন নির্ধারণ করে।
class todo {
  int userId; // ব্যবহারকারীর আইডি (API থেকে প্রাপ্ত)।
  int id;     // todo আইটেমের নিজস্ব আইডি (API থেকে প্রাপ্ত)।
  String title; // todo আইটেমের শিরোনাম (API থেকে প্রাপ্ত)।
  bool completed; // todo আইটেমটি সম্পন্ন হয়েছে কিনা (API থেকে প্রাপ্ত, true/false)।

  // todo ক্লাসের কনস্ট্রাক্টর।
  // নতুন todo অবজেক্ট তৈরি করার সময় এই ভ্যালুগুলো দিতে হবে।
  todo({
    required this.userId,    // userId বাধ্যতামূলক।
    required this.id,        // id বাধ্যতামূলক।
    required this.title,     // title বাধ্যতামূলক।
    required this.completed, // completed বাধ্যতামূলক।
  });

  // একটি ফ্যাক্টরি কনস্ট্রাক্টর, যা JSON (Map<String, dynamic>) থেকে একটি todo অবজেক্ট তৈরি করে।
  // API থেকে যখন JSON ডেটা আসে, তখন এই কনস্ট্রাক্টর ব্যবহার করে Dart অবজেক্টে রূপান্তর করা হয়।
  factory todo.fromJson(Map<String, dynamic> json) {
    return todo(
      userId: json['userId'],       // JSON ম্যাপ থেকে 'userId' ফিল্ডের ভ্যালু নেয়।
      id: json['id'],             // JSON ম্যাপ থেকে 'id' ফিল্ডের ভ্যালু নেয়।
      title: json['title'],         // JSON ম্যাপ থেকে 'title' ফিল্ডের ভ্যালু নেয়।
      completed: json['completed'], // JSON ম্যাপ থেকে 'completed' ফিল্ডের ভ্যালু নেয়।
    );
  }
}

// API থেকে todo ডেটা আনার জন্য একটি অ্যাসিঙ্ক্রোনাস ফাংশন।
// এই ফাংশনটি একটি Future রিটার্ন করে, যা সম্পন্ন হলে List<todo> (todo অবজেক্টের একটি লিস্ট) প্রদান করবে।
Future<List<todo>> fetchTodoData() async {
  // API-এর URL, যেখান থেকে todo ডেটা আনা হবে।
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

  // নির্দিষ্ট URL-এ একটি HTTP GET রিকোয়েস্ট পাঠানো হচ্ছে।
  // 'await' কিওয়ার্ড ব্যবহার করা হয়েছে কারণ এটি একটি অ্যাসিঙ্ক্রোনাস অপারেশন, রেসপন্স না আসা পর্যন্ত অপেক্ষা করবে।
  final response = await http.get(url);

  // HTTP রেসপন্সের স্ট্যাটাস কোড চেক করা হচ্ছে।
  // স্ট্যাটাস কোড 200 মানে রিকোয়েস্ট সফল হয়েছে।
  if (response.statusCode == 200) {
    // রেসপন্সের বডি (যা একটি JSON স্ট্রিং) থেকে Dart অবজেক্টের লিস্টে ডিকোড করা হচ্ছে।
    // jsonDecode response.body কে List<dynamic> এ পরিণত করে, যেখানে প্রতিটি আইটেম একটি Map<String, dynamic>।
    List<dynamic> jsonResponse = jsonDecode(response.body);

    // jsonResponse লিস্টের প্রতিটি JSON অবজেক্টকে (Map<String, dynamic>)
    // todo.fromJson ব্যবহার করে একটি todo অবজেক্টে রূপান্তর করা হচ্ছে।
    // .map() একটি Iterable<todo> রিটার্ন করে, এবং .toList() সেটিকে List<todo>-তে পরিণত করে।
    return jsonResponse.map((jsonTodo) => todo.fromJson(jsonTodo)).toList();
  } else {
    // যদি রিকোয়েস্ট সফল না হয় (যেমন, নেটওয়ার্ক সমস্যা বা সার্ভার এরর), তাহলে একটি Exception থ্রো করা হচ্ছে।
    throw Exception('Failed to load todo data from API');
  }
}

// UI (ইউজার ইন্টারফেস) তৈরির জন্য প্রধান MaterialApp উইজেট।
// এটি অ্যাপ্লিকেশনের মূল কাঠামো প্রদান করে।
class todoUi extends StatelessWidget {
  const todoUi({super.key}); // কনস্ট্রাক্টর, উইজেট ট্রিতে আইডেন্টিফিকেশনের জন্য key নেয়।

  @override
  Widget build(BuildContext context) {
    // MaterialApp উইজেট অ্যাপ্লিকেশনের রুট হিসেবে কাজ করে।
    // এটি থিম, নেভিগেশন এবং অন্যান্য মৌলিক UI কনফিগারেশন প্রদান করে।
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ডিবাগ মোডে ডানদিকের উপরের "DEBUG" ব্যানারটি লুকিয়ে রাখে।
      home: todoHomeUI(),             // অ্যাপ্লিকেশনের হোম স্ক্রিন হিসেবে todoHomeUI উইজেটকে সেট করে।
    );
  }
}

// অ্যাপ্লিকেশনের হোম স্ক্রিনের UI, এটি একটি StatefulWidget।
// StatefulWidget ব্যবহার করা হয়েছে কারণ এই স্ক্রিনের ডেটা (todo লিস্ট) পরিবর্তন হতে পারে (যেমন API থেকে লোড হওয়া)।
class todoHomeUI extends StatefulWidget {
  const todoHomeUI({super.key}); // কনস্ট্রাক্টর।

  @override
  // StatefulWidget-এর জন্য একটি State অবজেক্ট তৈরি করে। UI এবং ডেটা এই State অবজেক্টে ম্যানেজ করা হয়।
  State<todoHomeUI> createState() => _todoHomeUIState();
}

// todoHomeUI-এর State ক্লাস। UI-এর লজিক এবং পরিবর্তনশীল ডেটা এখানে থাকে।
class _todoHomeUIState extends State<todoHomeUI> {
  // একটি Future<List<todo>> ভ্যারিয়েবল, যা API থেকে প্রাপ্তব্য todo লিস্ট ধারণ করবে।
  // 'late' কিওয়ার্ড নির্দেশ করে যে এটি initState-এ ইনিশিয়ালাইজ করা হবে।
  late Future<List<todo>> futureTodo;

  @override
  void initState() {
    super.initState(); // State ক্লাসের প্যারেন্ট initState() কল করা হচ্ছে।
    // যখন এই উইজেটটি প্রথমবার তৈরি হয়, তখন API থেকে ডেটা আনার জন্য fetchTodoData() কল করা হয়।
    // এর রিটার্ন করা Future-টি futureTodo ভ্যারিয়েবলে অ্যাসাইন করা হয়।
    futureTodo = fetchTodoData();
  }

  // একটি helper ফাংশন, যা স্ক্রিনে একটি SnackBar (ছোট মেসেজ পপ-আপ) দেখায়।
  mySnk(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),             // SnackBar-এ দেখানো মেসেজ।
        duration: Duration(seconds: 4), // SnackBar কতক্ষণ দেখানো হবে।
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold একটি মৌলিক ম্যাটেরিয়াল ডিজাইন ভিজ্যুয়াল লেআউট স্ট্রাকচার প্রদান করে।
    // এটি AppBar, Body, FloatingActionButton ইত্যাদির জন্য জায়গা করে দেয়।
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'), // AppBar-এর টাইটেল।
      ),
      // FutureBuilder উইজেট একটি Future-এর অবস্থার উপর ভিত্তি করে UI তৈরি করে।
      // এটি অ্যাসিঙ্ক্রোনাস অপারেশনের ফলাফল দেখানোর জন্য খুবই উপযোগী।
      body: FutureBuilder<List<todo>>( // Future<List<todo>> টাইপের future আশা করছে।
        future: futureTodo,          // যে Future-টি পর্যবেক্ষণ করা হবে (আমাদের ক্ষেত্রে API কল)।
        // builder ফাংশন Future-এর বর্তমান অবস্থা (snapshot) অনুযায়ী UI তৈরি করে।
        builder: (context, snapshot) {
          // ConnectionState.waiting মানে Future এখনও সম্পন্ন হয়নি, ডেটা লোড হচ্ছে।
          if (snapshot.connectionState == ConnectionState.waiting) {
            // ডেটা লোড হওয়ার সময় একটি বৃত্তাকার লোডিং ইন্ডিকেটর দেখানো হচ্ছে।
            return Center(child: CircularProgressIndicator());
          }
          // snapshot.hasError মানে Future সম্পন্ন হওয়ার সময় কোনো ত্রুটি ঘটেছে।
          else if (snapshot.hasError) {
            // ত্রুটি ঘটলে একটি এরর মেসেজ দেখানো হচ্ছে।
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // snapshot.hasData মানে Future সফলভাবে সম্পন্ন হয়েছে এবং ডেটা রিটার্ন করেছে।
          else if (snapshot.hasData) {
            // snapshot.data থেকে প্রাপ্ত todo লিস্ট (List<todo>) একটি ভ্যারিয়েবলে রাখা হচ্ছে।
            // `snapshot.data!` ব্যবহার করা হয়েছে কারণ `hasData` true হলে `data` null হবে না।
            final List<todo> todos = snapshot.data!;

            // যদি ডেটা লিস্ট খালি হয়, তাহলে একটি মেসেজ দেখানো হচ্ছে।
            if (todos.isEmpty) {
              return Center(child: Text("No Todos Found"));
            }

            // ListView.builder ব্যবহার করে একটি স্ক্রোলযোগ্য লিস্ট তৈরি করা হচ্ছে।
            // এটি শুধুমাত্র দৃশ্যমান আইটেমগুলো রেন্ডার করে, যা পারফরম্যান্সের জন্য ভালো।
            return ListView.builder(
              itemCount: todos.length, // লিস্টে মোট আইটেমের সংখ্যা।
              // itemBuilder প্রতিটি আইটেমের জন্য UI তৈরি করে।
              itemBuilder: (context, index) {
                // বর্তমান ইনডেক্সের todo আইটেম।
                final todoData = todos[index];

                // প্রতিটি todo আইটেমকে একটি Card উইজেটের মধ্যে দেখানো হচ্ছে সুন্দর UI-এর জন্য।
                return Card(
                  elevation: 5, // কার্ডের ছায়া।
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // কার্ডের চারপাশে ফাঁকা জায়গা।
                  child: ListTile(
                    title: Text(todoData.title), // todo আইটেমের টাইটেল।
                    // ListTile-এর ডানদিকে একটি Checkbox দেখানো হচ্ছে।
                    trailing: Checkbox(
                      value: todoData.completed, // Checkbox-এর মান API থেকে প্রাপ্ত 'completed' স্ট্যাটাসের উপর নির্ভরশীল।
                      // Checkbox-এর মান পরিবর্তন হলে এই ফাংশনটি কল হবে।
                      onChanged: (bool? newValue) {
                        // Checkbox-এর মান পরিবর্তন হলে স্টেট আপডেট করার জন্য setState কল করা হচ্ছে।
                        setState(() {
                          todoData.completed = newValue ?? false; // newValue null হলে false সেট করা হচ্ছে।
                        });
                        // একটি SnackBar দেখানো হচ্ছে যা Checkbox পরিবর্তনের তথ্য দেয়।
                        mySnk('Checkbox for "${todoData.title}" changed to $newValue', context);
                      },
                    ),
                  ),
                );
              },
            );
          }
          // যদি snapshot.hasData false হয় (এবং কোনো error বা waiting state না থাকে),
          // তাহলে "No Data Found" মেসেজ দেখানো হচ্ছে। এটি একটি ফলব্যাক কেস।
          else {
            return Center(child: Text("No Data Found"));
          }
        },
      ),
    );
  }
}
 */
