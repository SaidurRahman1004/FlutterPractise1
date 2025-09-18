
//JSONPlaceholder API থেকে একটি নির্দিষ্ট "Post" নিয়ে আসার জন্য একটি UI তৈরি করো এবং সব ধরনের অবস্থা (loading, success, error, not found) পরিচালনা করো।
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Flutter%20Backend/ErrorHandleing/Post.dart';              //Post মডেল ক্লাস তৈরি করার পর ইমপোর্ট করা হলো!

//API ফাংশন তৈরি করো যা একটি id প্যারামিটার হিসেবে নেবে এবং ওই নির্দিষ্ট পোস্টটি নিয়ে আসবে
Future<Post> fetctchApiError(int id) async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");      //API Endpoint: https://jsonplaceholder.typicode.com/posts/{id}   (এখানে {id}-এর জায়গায় 1, 2, 10 বা যেকোনো সংখ্যা বসিয়ে চেষ্টা করবে)
  try {
    final responseApi = await http.get(url);
    if (responseApi.statusCode == 200) {
      return Post.fromJson(jsonDecode(responseApi.body));
    } else if (responseApi.statusCode == 404) {
      throw Exception(" ${responseApi.statusCode} Post id: $id not found");
    } else {
      throw Exception("Failed to load post ${responseApi.statusCode}");
    }
  } on SocketException {
    throw Exception("No Internet connection");
  } catch (e) {
    throw Exception("Something went wrong ${e.toString()}");
  }
}

//UI-তে একটি TextField রাখো যেখানে ইউজার একটি পোস্ট ID (যেমন: 1, 5, 100) ইনপুট দিতে পারবে এবং একটি "Fetch Post" বাটন থাকবে।

class ErrorTestingUIApiControl extends StatelessWidget {
  const ErrorTestingUIApiControl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Button Style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 4.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        //TextFeild Style
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
          ),
        ),
      ),
      home: ErrorTestingUIApi(),
    );
  }
}

class ErrorTestingUIApi extends StatefulWidget {
  const ErrorTestingUIApi({super.key});

  @override
  State<ErrorTestingUIApi> createState() => _ErrorTestingUIApiState();
}

class _ErrorTestingUIApiState extends State<ErrorTestingUIApi> {
  TextEditingController _idController =
      TextEditingController(); //TextField Controller
  Future<Post>? futureApi;                                        //TextFeild এর Text কন্ট্রোল করার জন্য!


  void _fetchPost() {                                    //Button Function বাটনে ক্লিক করলে এই ফাংশন কল হবে
    if (_idController.text.isNotEmpty) {
      try {
        final int id = int.parse(_idController.text);
        setState(() {
          futureApi = fetctchApiError(id);
        });
      } catch (e) {
        setState(() {
          futureApi = Future.error(Exception("${e.toString()}"));
        });
      }
    } else {
      setState(() {
        futureApi = Future.error(Exception("Please enter a Post ID"));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error Testing")),
      body: Padding(
        padding: EdgeInsets.all(8.02),
        child: Column(
          children: [
            TextFormField(
              //TextField
              controller: _idController,
              decoration: InputDecoration(labelText: "Enter Post ID"),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 10),

            ElevatedButton(                                 //Button   বাটনে ক্লিক করলে API কল শুরু হবে এবং UI-তে নিচের অবস্থাগুলো সুন্দরভাবে  Loading,Error,Success দেখাবে!
              onPressed: ()=> _fetchPost(),
              child: Text("Fetch Post"),
            ),
            const SizedBox(height: 30),
            //Api এর ডাটা লোড করা হচ্ছে!
            Expanded(
              child: FutureBuilder(
                future: futureApi,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());          //Loading
                  } else if (snapshot.hasError) {                               //Error
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData) {                                //Seccess
                    final data = snapshot.data!;
                    return Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Text("Title: ${data.title}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),textAlign: TextAlign.center),
                          Divider(),
                          Text("ID: ${data.id}",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15,)),                    //পোস্টের title
                          SizedBox(height: 5,),
                          Text("Body: ${data.body}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),                                  //পোস্টের body


                        ],
                      ),
                    );
                  }
                  return Center(child: Text("Enter Valid Id And Find Data"));  ///পেজ ওপেন হলে এই টেক্সট দেখাবে!
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
