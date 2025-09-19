import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


//একটি Post মডেল ক্লাস তৈরি করো (userId, id, title, body)।
class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}



//UiConTrol
class PaginationUiControl extends StatelessWidget {
  const PaginationUiControl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginationUi(),
    );
  }
}

class PaginationUi extends StatefulWidget {
  const PaginationUi({super.key});

  @override
  State<PaginationUi> createState() => _PaginationUiState();
}

class _PaginationUiState extends State<PaginationUi> {
  final List<Post> _postList = [];
  int _pageCount = 1;
  bool _loadData = false;
  bool _mareData = true;
  final ScrollController _scrollControl = ScrollController();

  //Api Calling
  Future<void> _fetchElementPhoto()async{
    if(_loadData) return;

    setState(() {
      _loadData = true;
    });

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts?_page=$_pageCount&_limit=15"));

    if(response.statusCode == 200){
      List<dynamic> jsonResponse = jsonDecode(response.body);
      if(jsonResponse.isEmpty){
        setState(() {
          _mareData = false;
        });
      }
      else{
        setState(() {
          _pageCount++;
          _postList.addAll(jsonResponse.map((posts)=>Post.fromJson(posts)).toList());
        });
      }
    }else{
//Use Snackbar or toast
    }

    setState(() {
      _loadData = false;
    });
  }

  //avoid memory leak
  @override
  void dispose(){
    _scrollControl.dispose();
    super.dispose();
  }

  //Scroll Control & last page detection
  @override
  void initState(){
    super.initState();
    _fetchElementPhoto();

    _scrollControl.addListener(     //last screen pixel aned scroll Detection in screen

        (){
          if(_scrollControl.position.pixels == _scrollControl.position.maxScrollExtent && _mareData){
            _fetchElementPhoto();
          }
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagination UI")),
      body: SafeArea(child: ListView.builder(
          controller: _scrollControl,
          itemCount: _postList.length + (_mareData? 1:0),
          itemBuilder: (context,index){
            if(index == _postList.length){
              return Center(child: CircularProgressIndicator());
            }
            else{
              final postElement = _postList[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(child: Text("${postElement.id.toString()}"),),
                  title: Text(postElement.title!,maxLines: 1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  subtitle: Text(postElement.body!,maxLines: 2,style: TextStyle(fontSize: 10),),

                ),
              );
            }

          }
      )),

    );
  }
}



