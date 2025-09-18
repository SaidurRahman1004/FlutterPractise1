/////////////////////Temp 1 API Fetch Task/////////////////

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/Flutter%20Backend/ErrorHandleing/Post.dart';

//API Function Created
Future<Post> apiFunction(int id) async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
  try {
    final response = await http.get(url).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("Post $id not  found");
    } else {
      throw Exception("Failed to load post ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Something went wrong ${e.toString()}");
  }
}

//UI
class ErrorTestingUI extends StatelessWidget {
  ErrorTestingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenErrUi(),
    );
  }
}

class HomeScreenErrUi extends StatefulWidget {
  const HomeScreenErrUi({super.key});

  @override
  State<HomeScreenErrUi> createState() => _HomeScreenErrUiState();
}

class _HomeScreenErrUiState extends State<HomeScreenErrUi> {
  //UI State Variables
  TextEditingController idController = TextEditingController();
  Post? post; // Success data
  bool isLoading = false;
  String? errorMessage; // Error store
  //Button Action
  Future<void> getPost() async {
    final id = int.tryParse(idController.text);
    if (id == null) {
      setState(() => errorMessage = "Please enter a valid number.");
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
      post = null;
    });

    try {
      final fetchedPost = await apiFunction(id);
      setState(() {
        post = fetchedPost;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fetch Post Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: "Enter Post ID",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: getPost, child: const Text("Fetch Post")),
            const SizedBox(height: 20),

            // UI States
            if (isLoading) const CircularProgressIndicator(),
            if (errorMessage != null)
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            if (post != null)
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post!.title ?? " ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(post!.body ?? ""),
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
//////////////////////////////////////////
/////////////////////////////////////////Explained....................

/*
import 'dart:async'; // অ্যাসিঙ্ক্রোনাস প্রোগ্রামিং, যেমন Future এবং Stream ব্যবহারের জন্য। API কল অ্যাসিঙ্ক্রোনাস হয়।
import 'dart:io'; // ইনপুট/আউটপুট অপারেশন, যেমন ইন্টারনেট সংযোগ না থাকলে SocketException হ্যান্ডেল করার জন্য।

import 'package:flutter/cupertino.dart'; // iOS স্টাইলের উইজেট (এই কোডে সরাসরি ব্যবহৃত না হলেও, flutter/material ইম্পোর্ট করলে এটিও আসে)।
import 'package:flutter/material.dart'; // ম্যাটেরিয়াল ডিজাইন উইজেট (UI তৈরির মূল ভিত্তি)।
import 'package:http/http.dart' as http; // HTTP রিকোয়েস্ট (API কল) করার জন্য। 'as http' দিয়ে একে একটি নেমস্পেস দেওয়া হয়েছে।
import 'dart:convert'; // JSON ডেটা এনকোড ও ডিকোড করার জন্য। API থেকে পাওয়া JSON রেসপন্স পার্স করতে কাজে লাগে।

import 'package:myapp/Flutter%20Backend/ErrorHandleing/Post.dart'; // Post ডেটা মডেল ক্লাস ইম্পোর্ট করা হচ্ছে। API থেকে পাওয়া ডেটাকে এই মডেলে ম্যাপ করা হবে।

// API Function Created
Future<Post> apiFunction(int id) async { // একটি অ্যাসিঙ্ক্রোনাস ফাংশন যা একটি 'id' নেয় এবং ভবিষ্যতে একটি 'Post' অবজেক্ট রিটার্ন করবে।
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"); // API-এর URL তৈরি করা হচ্ছে। '$id' দিয়ে ডাইনামিকভাবে URL-এ পোস্ট আইডি যুক্ত করা হচ্ছে।
  try { // এরর হ্যান্ডেলিং-এর জন্য try-catch ব্লক শুরু। নেটওয়ার্ক বা অন্যান্য সমস্যা হতে পারে।
    final response = await http.get(url).timeout(Duration(seconds: 5)); // নির্দিষ্ট URL-এ GET রিকোয়েস্ট পাঠানো হচ্ছে। '.timeout(Duration(seconds: 5))' দিয়ে ৫ সেকেন্ডের মধ্যে রেসপন্স না পেলে TimeoutException থ্রো করা হবে। 'await' দিয়ে রিকোয়েস্ট শেষ না হওয়া পর্যন্ত অপেক্ষা করা হচ্ছে।

    if (response.statusCode == 200) { // যদি সার্ভার থেকে সফলভাবে রেসপন্স আসে (স্ট্যাটাস কোড ২০০)।
      return Post.fromJson(jsonDecode(response.body)); // রেসপন্সের বডি (যা একটি JSON স্ট্রিং) ডিকোড করে Post মডেলে কনভার্ট করে রিটার্ন করা হচ্ছে।
    } else if (response.statusCode == 404) { // যদি সার্ভার রিসোর্স খুঁজে না পায় (স্ট্যাটাস কোড ৪০৪)।
      throw Exception("Post $id not found"); // একটি কাস্টম এরর মেসেজসহ Exception থ্রো করা হচ্ছে।
    } else { // অন্য কোনো সার্ভার এরর হলে (যেমন ৫০০, ৫০৩ ইত্যাদি)।
      throw Exception("Failed to load post ${response.statusCode}"); // স্ট্যাটাস কোডসহ একটি এরর মেসেজ থ্রো করা হচ্ছে।
    }
  } on SocketException { // যদি ইন্টারনেট সংযোগ না থাকে বা DNS সমস্যা হয়।
    throw Exception("No Internet Connection"); // ইন্টারনেট না থাকার জন্য কাস্টম Exception থ্রো করা হচ্ছে।
  } on FormatException { // যদি API থেকে পাওয়া JSON ডেটা সঠিকভাবে পার্স করা না যায়।
    throw Exception("Invalid Format"); // ভুল ফরম্যাটের জন্য কাস্টম Exception থ্রো করা হচ্ছে।
  } on TimeoutException { // যদি নির্দিষ্ট সময়ের মধ্যে (৫ সেকেন্ড) API থেকে রেসপন্স না আসে।
    throw Exception("Request timed out. Please try again."); // টাইমআউটের জন্য কাস্টম Exception থ্রো করা হচ্ছে। (আপনার কোডে "Something went wrong" ছিল, আমি একটু স্পেসিফিক করলাম)
  } catch (e) { // উপরে উল্লেখ করা নির্দিষ্ট Exception গুলো ছাড়া অন্য কোনো অজানা Exception ঘটলে।
    throw Exception("Something went wrong: ${e.toString()}"); // সাধারণ এরর মেসেজসহ মূল এররটি দেখানো হচ্ছে।
  }
}

// UI
class ErrorTestingUI extends StatelessWidget { // একটি স্টেটলেস উইজেট যা অ্যাপের মূল কাঠামো তৈরি করে।
  ErrorTestingUI({super.key}); // কনস্ট্রাক্টর।

  @override
  Widget build(BuildContext context) { // UI কেমন হবে তা এই মেথড ডিফাইন করে।
    return MaterialApp( // একটি ম্যাটেরিয়াল ডিজাইন অ্যাপ তৈরি করে। এটি অ্যাপের রুট উইজেট।
      debugShowCheckedModeBanner: false, // ডিবাগ মোডে থাকা অবস্থায় ডানদিকের উপরের "DEBUG" ব্যানারটি সরিয়ে দেয়।
      home: HomeScreenErrUi(), // অ্যাপের হোম স্ক্রিন হিসেবে HomeScreenErrUi উইজেটকে সেট করে।
    );
  }
}

class HomeScreenErrUi extends StatefulWidget { // একটি স্টেটফুল উইজেট, কারণ এর UI ডেটার পরিবর্তনের সাথে সাথে আপডেট হবে (যেমন লোডিং, এরর, পোস্ট ডেটা)।
  const HomeScreenErrUi({super.key}); // কনস্ট্রাক্টর।

  @override
  State<HomeScreenErrUi> createState() => _HomeScreenErrUiState(); // এই উইজেটের স্টেট অবজেক্ট তৈরি করে।
}

class _HomeScreenErrUiState extends State<HomeScreenErrUi> { // HomeScreenErrUi উইজেটের স্টেট ম্যানেজ করে।
  // UI State Variables
  TextEditingController idController = TextEditingController(); // TextField থেকে ইউজারের ইনপুট (পোস্ট আইডি) নেওয়ার জন্য কন্ট্রোলার।
  Post? post; // API থেকে সফলভাবে লোড হওয়া পোস্ট ডেটা এখানে স্টোর করা হবে। '?' মানে এটি null হতে পারে।
  bool isLoading = false; // API কল চলাকালীন লোডিং ইন্ডিকেটর দেখানোর জন্য এই ফ্ল্যাগ।
  String? errorMessage; // কোনো এরর ঘটলে সেই এরর মেসেজ এখানে স্টোর করা হবে। '?' মানে এটি null হতে পারে।

  // Button Action
  Future<void> getPost() async { // "Fetch Post" বাটনে ক্লিক করলে এই অ্যাসিঙ্ক্রোনাস ফাংশনটি কল হবে।
    final idString = idController.text; // TextField থেকে ইউজারের দেওয়া টেক্সট (আইডি) নেওয়া হচ্ছে।
    if (idString.isEmpty) { // যদি ইউজার কোনো আইডি ইনপুট না দেয়।
        setState(() { // UI আপডেট করার জন্য setState কল করা হচ্ছে।
            errorMessage = "Please enter a Post ID."; // এরর মেসেজ সেট করা হচ্ছে।
            post = null; // আগের কোনো পোস্ট ডেটা থাকলে তা ক্লিয়ার করা হচ্ছে।
            isLoading = false; // লোডিং বন্ধ করা হচ্ছে।
        });
        return; // ফাংশন থেকে বেরিয়ে যাওয়া হচ্ছে।
    }

    final id = int.tryParse(idString); // টেক্সট থেকে আইডিকে ইন্টিজারে কনভার্ট করার চেষ্টা করা হচ্ছে। 'tryParse' ব্যবহার করলে ভুল ইনপুটে অ্যাপ ক্র্যাশ করবে না, null রিটার্ন করবে।
    if (id == null) { // যদি ইউজার ভ্যালিড নম্বর ইনপুট না দেয় (যেমন "abc")।
      setState(() { // UI আপডেট করার জন্য setState কল করা হচ্ছে।
        errorMessage = "Please enter a valid number for Post ID."; // এরর মেসেজ সেট করা হচ্ছে।
        post = null; // আগের কোনো পোস্ট ডেটা থাকলে তা ক্লিয়ার করা হচ্ছে।
        isLoading = false; // লোডিং বন্ধ করা হচ্ছে।
      });
      return; // ফাংশন থেকে বেরিয়ে যাওয়া হচ্ছে।
    }

    setState(() { // UI আপডেট করার জন্য setState কল করা হচ্ছে।
      isLoading = true; // লোডিং শুরু হচ্ছে, তাই true সেট করা হচ্ছে।
      errorMessage = null; // আগের কোনো এরর মেসেজ থাকলে তা ক্লিয়ার করা হচ্ছে।
      post = null; // আগের কোনো পোস্ট ডেটা থাকলে তা ক্লিয়ার করা হচ্ছে। নতুন রিকোয়েস্টের আগে UI পরিষ্কার করা হচ্ছে।
    });

    try { // apiFunction কল করার সময় এরর হতে পারে, তাই try-catch ব্লক।
      final fetchedPost = await apiFunction(id); // apiFunction কল করে পোস্ট ডেটা আনা হচ্ছে। 'await' দিয়ে অপেক্ষা করা হচ্ছে।
      setState(() { // UI আপডেট করার জন্য setState কল করা হচ্ছে।
        post = fetchedPost; // সফলভাবে পাওয়া পোস্ট ডেটা 'post' ভ্যারিয়েবলে অ্যাসাইন করা হচ্ছে।
        // isLoading = false; // লোডিং এখানে false করা হচ্ছে না, finally ব্লকে করা হবে।
      });
    } catch (e) { // যদি apiFunction থেকে কোনো Exception থ্রো হয়।
      setState(() { // UI আপডেট করার জন্য setState কল করা হচ্ছে।
        errorMessage = e.toString().replaceFirst("Exception: ", ""); // Exception অবজেক্টকে স্ট্রিং-এ কনভার্ট করে এরর মেসেজ হিসেবে সেট করা হচ্ছে। "Exception: " প্রিফিক্স বাদ দেওয়া হচ্ছে।
        // isLoading = false; // লোডিং এখানে false করা হচ্ছে না, finally ব্লকে করা হবে।
      });
    } finally { // try বা catch ব্লক 실행 হওয়ার পর এই ব্লকটি সবসময় 실행 হবে।
      setState(() => isLoading = false); // API কল সফল হোক বা ব্যর্থ, লোডিং বন্ধ করা হচ্ছে।
    }
  }

  @override
  void dispose() { // উইজেট যখন UI ট্রি থেকে সরানো হবে, তখন এই মেথড কল হবে।
    idController.dispose(); // TextEditingController ডিসপোজ করা হচ্ছে মেমোরি লিক এড়ানোর জন্য।
    super.dispose(); // প্যারেন্ট ক্লাসের dispose মেথড কল করা হচ্ছে।
  }

  @override
  Widget build(BuildContext context) { // এই মেথড UI-এর কাঠামো তৈরি করে।
    return Scaffold( // একটি বেসিক ম্যাটেরিয়াল ডিজাইন ভিজ্যুয়াল লেআউট স্ট্রাকচার প্রদান করে (যেমন AppBar, Body)।
      appBar: AppBar(title: const Text("Fetch Post Example")), // অ্যাপের উপরে একটি AppBar দেখানো হচ্ছে যার টাইটেল "Fetch Post Example"।
      body: Padding( // বডির চারপাশে প্যাডিং (ফাঁকা জায়গা) যোগ করা হচ্ছে।
        padding: const EdgeInsets.all(16.0), // সবদিকে ১৬ পিক্সেল প্যাডিং।
        child: SingleChildScrollView( // কন্টেন্ট যদি স্ক্রিনের চেয়ে বড় হয়, তাহলে স্ক্রল করার সুবিধা দেওয়ার জন্য।
          child: Column( // উইজেটগুলোকে উল্লম্বভাবে সাজানোর জন্য Column উইজেট।
            children: [
              TextField( // ইউজারের কাছ থেকে টেক্সট ইনপুট নেওয়ার জন্য।
                controller: idController, // এই TextField-কে idController এর সাথে যুক্ত করা হচ্ছে।
                decoration: InputDecoration( // TextField-এর সজ্জা (যেমন লেবেল, বর্ডার)।
                  labelText: "Enter Post ID", // TextField-এর উপরে একটি লেবেল দেখানো হচ্ছে।
                  border: OutlineInputBorder(), // TextField-এর চারপাশে একটি বর্ডার।
                  errorText: errorMessage != null && (errorMessage!.contains("Please enter a Post ID") || errorMessage!.contains("valid number")) ? errorMessage : null, // যদি ইনপুট সংক্রান্ত এরর থাকে, সেটি এখানে দেখানো হবে।
                ),
                keyboardType: TextInputType.number, // কি-বোর্ডের টাইপ নম্বর হিসেবে সেট করা হচ্ছে, যাতে ইউজার শুধু নম্বর ইনপুট দিতে পারে।
              ),
              const SizedBox(height: 10), // দুটি উইজেটের মাঝে ১০ পিক্সেল উল্লম্ব ফাঁকা জায়গা।
              ElevatedButton( // একটি ম্যাটেরিয়াল ডিজাইন বাটন।
                onPressed: isLoading ? null : getPost, // যদি লোডিং চলে (isLoading == true) তাহলে বাটন ডিসেবল (null), অন্যথায় getPost ফাংশন কল হবে।
                child: isLoading // বাটনের চাইল্ড উইজেট কন্ডিশনালি দেখানো হচ্ছে।
                    ? const SizedBox( // লোডিং চললে একটি ছোট সাইজের ইন্ডিকেটর দেখানো হবে।
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Text("Fetch Post"), // লোডিং না চললে "Fetch Post" টেক্সট দেখানো হবে।
              ),
              const SizedBox(height: 20), // ২০ পিক্সেল উল্লম্ব ফাঁকা জায়গা।

              // UI States - কন্ডিশনালভাবে বিভিন্ন UI দেখানো হচ্ছে।
              if (isLoading) const CircularProgressIndicator(), // যদি isLoading true হয়, তাহলে একটি লোডিং স্পিনার দেখানো হবে।
              if (errorMessage != null && !(errorMessage!.contains("Please enter a Post ID") || errorMessage!.contains("valid number"))) // যদি এরর মেসেজ থাকে এবং সেটি ইনপুট ভ্যালিডেশন এরর না হয়।
                Padding( // এরর মেসেজের চারপাশে প্যাডিং।
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    errorMessage!, // এরর মেসেজ দেখানো হচ্ছে। '!' দিয়ে নিশ্চিত করা হচ্ছে যে errorMessage null নয়।
                    style: const TextStyle(color: Colors.red, fontSize: 16), // এরর মেসেজের স্টাইল (লাল রঙ, ১৬ ফন্ট সাইজ)।
                    textAlign: TextAlign.center, // টেক্সট অ্যালাইনমেন্ট সেন্টার।
                  ),
                ),
              if (post != null) // যদি পোস্ট ডেটা সফলভাবে লোড হয়ে থাকে (post null না হয়)।
                Card( // পোস্ট ডেটা একটি কার্ডের মধ্যে সুন্দরভাবে দেখানোর জন্য।
                  elevation: 5, // কার্ডের নিচে একটি শ্যাডো ইফেক্ট।
                  margin: const EdgeInsets.symmetric(vertical: 10), // কার্ডের উপরে ও নিচে ১০ পিক্সেল মার্জিন।
                  child: Padding( // কার্ডের ভিতরের কন্টেন্টের চারপাশে প্যাডিং।
                    padding: const EdgeInsets.all(12.0),
                    child: Column( // কার্ডের ভিতরের টাইটেল ও বডি উল্লম্বভাবে সাজানোর জন্য।
                      crossAxisAlignment: CrossAxisAlignment.start, // কন্টেন্টগুলো বাম দিক থেকে শুরু হবে।
                      children: [
                        Text(
                          post!.title, // পোস্টের টাইটেল দেখানো হচ্ছে। 'post!' ব্যবহার করা হচ্ছে কারণ আমরা 이미 'post != null' চেক করেছি।
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // টাইটেলের টেক্সট বোল্ড হবে।
                            fontSize: 18, // ফন্ট সাইজ ১৮।
                          ),
                        ),
                        const SizedBox(height: 10), // টাইটেল ও বডির মাঝে ১০ পিক্সেল ফাঁকা জায়গা।
                        Text(post!.body), // পোস্টের বডি দেখানো হচ্ছে।
                      ],
                    ),
                  ),
                ),
              if (!isLoading && post == null && errorMessage == null) // যদি লোডিং না থাকে, কোনো পোস্ট ডেটাও না থাকে এবং কোনো এরর মেসেজও না থাকে (প্রাথমিক অবস্থা)।
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                      "Enter a Post ID and click 'Fetch Post' to see details.",
                      textAlign: TextAlign.center,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
 */
