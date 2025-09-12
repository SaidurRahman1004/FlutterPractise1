import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:collection'; // UnmodifiableListView ব্যবহারের জন্য

// ১. ChangeNotifier ক্লাস তৈরি
class TodoProvider extends ChangeNotifier {
  final List<String> _tasks = [];

  // বহিরাগত থেকে List-কে সরাসরি পরিবর্তন করা রোধ করতে UnmodifiableListView ব্যবহার করা হয়
  UnmodifiableListView<String> get tasks => UnmodifiableListView(_tasks);

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners(); // UI-কে জানানো হচ্ছে যে একটি নতুন টাস্ক যোগ হয়েছে
  }

  void removeTask(String task) {
    _tasks.remove(task);
    notifyListeners(); // UI-কে জানানো হচ্ছে যে একটি টাস্ক মুছে ফেলা হয়েছে
  }
}



class AppProviderState extends StatelessWidget {
  const AppProviderState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Consumer ব্যবহার করে UI আপডেট করা হচ্ছে
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List with Provider')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'New Task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      // context.read ব্যবহার করে মেথড কল করা হচ্ছে
                      context.read<TodoProvider>().addTask(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            // Consumer শুধুমাত্র লিস্ট অংশটিকে rebuild করবে
            child: Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                return ListView.builder(
                  itemCount: todoProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = todoProvider.tasks[index];
                    return ListTile(
                      title: Text(task),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoProvider>().removeTask(task);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}