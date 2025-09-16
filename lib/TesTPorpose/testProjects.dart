




//////////////////////////////////Example JSOn APi///////////////////////////////////////

/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ক. User Model ক্লাস
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // JSON (Map) থেকে User অবজেক্ট তৈরির জন্য factory constructor
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

// খ. API থেকে ডেটা আনার জন্য ফাংশন
Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) { // 200 মানে সফল
    List<dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}

// গ. UI স্ক্রিন
class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers(); // initState-এ Future কল করা হচ্ছে
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users from API')),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers, // FutureBuilder-কে Future দেওয়া হচ্ছে
          builder: (context, snapshot) {
            // ডেটা লোড হচ্ছে
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            // কোনো error হয়েছে
            else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            // ডেটা সফলভাবে এসেছে
            else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(user.id.toString())),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            }
            // ডিফল্ট অবস্থা
            return const Text('No users found.');
          },
        ),
      ),
    );
  }
}

 */

/////////////////////////////////পProvider State Management////////////////////
/*
// ... (import statements for http, convert, material) ...
import 'package:provider/provider.dart'; // Provider ইম্পোর্ট করুন

// --- ডেটা মডেল (todo class) ---
// (আপনার আগের todo ক্লাসটি অপরিবর্তিত থাকবে)
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

// --- ChangeNotifier ক্লাস (State Management Logic) ---
class TodoProvider extends ChangeNotifier {
  List<todo> _todos = []; // প্রাইভেট লিস্ট, যা todo আইটেমগুলো ধারণ করবে
  bool _isLoading = false; // লোডিং স্টেট ট্র্যাক করার জন্য
  String? _errorMessage; // এরর মেসেজ ধারণ করার জন্য

  // UI থেকে todo লিস্ট অ্যাক্সেস করার জন্য Getter
  List<todo> get todos => _todos;
  // UI থেকে লোডিং স্টেট অ্যাক্সেস করার জন্য Getter
  bool get isLoading => _isLoading;
  // UI থেকে এরর মেসেজ অ্যাক্সেস করার জন্য Getter
  String? get errorMessage => _errorMessage;

  // API থেকে todo ডেটা আনার জন্য অ্যাসিঙ্ক্রোনাস ফাংশন
  Future<void> fetchTodos() async {
    _isLoading = true;
    _errorMessage = null; // আগের এরর মেসেজ ক্লিয়ার করুন
    notifyListeners(); // UI-কে জানান যে লোডিং শুরু হয়েছে

    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        _todos = jsonResponse.map((jsonTodo) => todo.fromJson(jsonTodo)).toList();
      } else {
        _errorMessage = 'Failed to load todo data from API (Status code: ${response.statusCode})';
        _todos = []; // এরর হলে লিস্ট খালি করুন
      }
    } catch (e) {
      _errorMessage = 'An error occurred: ${e.toString()}';
      _todos = []; // এরর হলে লিস্ট খালি করুন
    }

    _isLoading = false;
    notifyListeners(); // UI-কে জানান যে লোডিং শেষ হয়েছে এবং ডেটা/এরর আপডেট হয়েছে
  }

  // একটি নির্দিষ্ট todo আইটেমের 'completed' স্ট্যাটাস টগল করার জন্য ফাংশন
  void toggleTodoCompleted(int todoId) {
    // যে todo আইটেমটির স্ট্যাটাস পরিবর্তন করতে হবে, সেটি খুঁজুন
    final todoIndex = _todos.indexWhere((item) => item.id == todoId);
    if (todoIndex != -1) {
      _todos[todoIndex].completed = !_todos[todoIndex].completed;
      notifyListeners(); // UI-কে জানান যে একটি আইটেম পরিবর্তিত হয়েছে
    }
  }
}

// --- UI (User Interface) ---

// main.dart বা আপনার অ্যাপের এন্ট্রি পয়েন্টে Provider সেটআপ করতে হবে
/*
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(), // TodoProvider ইন্সট্যান্স তৈরি করুন
      child: const TodoApp(), // আপনার মূল অ্যাপ উইজেট
    ),
  );
}
*/

// আপনার মূল অ্যাপ্লিকেশনের উইজেট (আগে যা todoUi ছিল)
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHomeScreen(), // হোম স্ক্রিন
    );
  }
}

// হোম স্ক্রিন UI
class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  void initState() {
    super.initState();
    // উইজেট তৈরি হওয়ার সাথে সাথে ডেটা আনার জন্য Provider থেকে fetchTodos() কল করুন।
    // listen: false ব্যবহার করা হয় initState/didChangeDependencies এর মধ্যে Provider অ্যাক্সেস করার সময়,
    // কারণ এই পর্যায়ে UI এখনো বিল্ড হয়নি বা আমরা শুধু মেথড কল করতে চাই, পরিবর্তন শুনতে নয়।
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoProvider>(context, listen: false).fetchTodos();
    });
  }

  // SnackBar দেখানোর helper ফাংশন (আগের মতোই)
  void _showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Consumer উইজেট ব্যবহার করে TodoProvider থেকে ডেটা এবং স্টেট শোনা হয়
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List (Provider)'),
        actions: [
          // রিফ্রেশ বাটন (ঐচ্ছিক)
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false).fetchTodos();
            },
          )
        ],
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          // লোডিং স্টেট চেক করুন
          if (todoProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // এরর স্টেট চেক করুন
          if (todoProvider.errorMessage != null) {
            return Center(child: Text('Error: ${todoProvider.errorMessage}'));
          }

          // ডেটা খালি কিনা চেক করুন
          if (todoProvider.todos.isEmpty) {
            return const Center(child: Text('No Todos Found'));
          }

          // ডেটা থাকলে ListView দেখান
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              final todoItem = todoProvider.todos[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(todoItem.title),
                  trailing: Checkbox(
                    value: todoItem.completed,
                    onChanged: (bool? newValue) {
                      // Provider থেকে toggleTodoCompleted মেথড কল করুন
                      todoProvider.toggleTodoCompleted(todoItem.id);
                      _showSnackBar(
                        'Todo "${todoItem.title}" marked as ${newValue! ? "completed" : "incomplete"}',
                        context,
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
 */