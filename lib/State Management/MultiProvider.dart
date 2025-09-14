import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//CounterProvider
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

//UserProvider
class UserProvider extends ChangeNotifier {
  String _username = "siyam";

  String get username => _username;

  void changeUsername(String newName) {
    _username = newName;
    notifyListeners();
  }
}
//MultiProvider CAll
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MultiProviderEx(),
    ),
  );
}
//UI
class MultiProviderEx extends StatelessWidget {
  const MultiProviderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProviderUI(),
    );
  }
}

class MultiProviderUI extends StatelessWidget {
  const MultiProviderUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome ${context.watch<UserProvider>().username} ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(onPressed: (){Dialog(context);}, child:Text("Input"))

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count: ${context.watch<CounterProvider>().count}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: Icon(CupertinoIcons.add),
            ),
          ],
        ),
      ),
    );
  }

  void Dialog(context) {
    TextEditingController _nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text("Input Form"),
        children: [
          Container(
            height: 400, width: 350,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: (){
                    context.read<UserProvider>().changeUsername(_nameController.text);
                    Navigator.pop(context);
                    _nameController.clear();

                  }, child: Text("Save"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                  ),),
                ],
              ),
            ),
          )],
      ),
    );
  }
}
