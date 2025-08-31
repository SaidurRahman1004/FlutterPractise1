//Practise Ans:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIgetJson extends StatefulWidget {
  const APIgetJson({super.key});

  @override
  State<APIgetJson> createState() => _APIgetJsonState();
}


class _APIgetJsonState extends State<APIgetJson> {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(url);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw Exception("Failed to load data");
    }

  }
  late Future<List<dynamic>> _userFutureFtchDAta;
  @override
  void initState() {
    super.initState();
    _userFutureFtchDAta = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Data')),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
            future: _userFutureFtchDAta,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator(color: Colors.redAccent,);
              }else if (snapshot.hasError){
                return Text("Error: ${snapshot.error}");
              }else if(snapshot.hasData){
                var users = snapshot.data;
                return ListView.builder(
                  itemCount: users!.length,
                    itemBuilder: (context,index){
                    var user = users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(user["name"][0]),
                      ),
                      title: Text(user["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(user["email"]),
                    );
                    },
                );
              }
              return Center(child: Text("No data"));
            },

        ),

      ),
    );
  }
}
