import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'jsontodoAutomated.g.dart'; //ফাইলের নামের সাথে সেম হতে হবে!

//todo Model class
@JsonSerializable()
class TodoModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
//todo API call

Future<List<TodoModel>> fetchTodoData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((Todo) => TodoModel.fromJson(Todo)).toList();
  } else
    throw Exception('Failed to load todo');
}
////todo Ui
class TodoUiMain extends StatelessWidget {
  const TodoUiMain({super.key});

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
  late Future<List<TodoModel>> futureTodo;

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
      body: FutureBuilder<List<TodoModel>>(
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