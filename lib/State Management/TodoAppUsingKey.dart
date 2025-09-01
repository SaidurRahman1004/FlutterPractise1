//Practice Task 7.4 – Keys in Action TaskApp Ans Submitted
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicTodo extends StatefulWidget {
   BasicTodo({super.key});

  @override
  State<BasicTodo> createState() => _BasicTodoState();
}

class _BasicTodoState extends State<BasicTodo> {
  final TextEditingController _taskController = TextEditingController();

  final List<String> _tasksStore = [];
  mySnackbarCus(msg,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg))
    );
  }
  void _addTask (){
    if(_taskController.text.isNotEmpty){
      setState(() {
        _tasksStore.add(_taskController.text);
        _taskController.clear();
      });
    }else
      {
        mySnackbarCus("Enter a task", context);
      }
  }

  void _removeTask(String taskToRemove){
    setState(() {
      _tasksStore.remove(taskToRemove);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Todo"),
      ),
      body: Column(
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget> [
                Flexible(
                  child: TextField(
                    controller: _taskController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter a task",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      ),
                    onSubmitted: (value)=> _addTask(),


                    ),

                  ),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){_addTask();}, child: Text("Add Task"))

              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _tasksStore.length,
                  itemBuilder: (context,index){
                    final task = _tasksStore[index];
                    return Card(
                      key: ValueKey(task),
                      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      elevation: 5,
                      child: ListTile(
                        title: Text(task),
                        trailing: IconButton(onPressed: () { _removeTask(task); },
                        icon: Icon(Icons.remove_circle,color: Colors.red,)),

                      ),
                    );


                  }
                  ),
          ),
        ],
      ),

    );
  }
  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }
}
