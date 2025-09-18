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
