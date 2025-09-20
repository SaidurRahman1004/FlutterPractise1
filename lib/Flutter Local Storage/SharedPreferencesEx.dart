import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameSFProvider with ChangeNotifier {
  NameSFProvider(){_loadNmaeData();}
  static const String USERNAME_KEY = "username_key";
  String? _username;
  String? get username => _username;


  //Sava UserNAme Data
  Future<void> _saveUserNAme(String NameValue) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(USERNAME_KEY,NameValue);
    _username = NameValue;
  }

  //Load or Read UserNAme Data
  Future<void> _loadNmaeData() async{
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString(USERNAME_KEY) ?? "";        //Defult Value Name
    notifyListeners();
  }

     Future<void> changeUsername(String newName) async{
       await _saveUserNAme(newName);

    notifyListeners();
  }
}

class WelcomeAppSf extends StatelessWidget {
  const WelcomeAppSf({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
   bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final provider = context.watch<NameSFProvider>();
    final savedname = provider.username ?? "";

    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Flutter')),
      body: Center(
        child: savedname.isEmpty || _isEditing ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              savedname.isEmpty
                  ? "Please enter your name"
                  : "Edit your name",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    focusColor: Colors.red,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async{
                if(_nameController.text.trim().isNotEmpty){
                  await context.read<NameSFProvider>().changeUsername(_nameController.text.trim());
                    setState(() {
                      _isEditing = false;
                    });
                  _nameController.clear();
                }


              },
              child: Text("Save"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back: $savedname",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),

            ElevatedButton(
              onPressed: () async{
                setState(() {
                  _isEditing = true;
                  _nameController.text = savedname;
                });

              },
              child: Text("Edit",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
