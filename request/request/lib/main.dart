import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() => runApp(MyApp());

void gethttp() async {
  Response response = await Dio().get("http://www.baidu.com");
  print(response);
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: Text( 'Fetch Data Example'),

        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data.title);
              }else{
                return Text(snapshot.error);

              }
            },
          ),
        ),
      ),
    );
  }
}
Future <Post> fetchPost() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);
  return new Post.fromJson(responseJson);
}

class Post {
  final int userID;
  final int id;
  final String title;
  final String body;

  Post({this.userID, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return new Post(userID: json['userID'],
        id: json['userID'],
        title: json['userID'],
        body: json['userID']);
  }
}
