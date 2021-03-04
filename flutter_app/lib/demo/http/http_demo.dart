import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  List<PostModel> beanList = [];

  @override
  void initState() {
    super.initState();

    fetchPost();
//    fetchPost().then((value) => print(value));

//    print(beanList);
  }

  @override
  Widget build(BuildContext context) {
    if (beanList.length != 0) {
      return ListView(
        children: beanList.map((item) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.imageUrl),
            ),
            title: Text(item.title),
            subtitle: Text(item.author),
          );
        }).toList(),
      );
    } else {
      return Container();
    }
  }

  Future<List<PostModel>> fetchPost() async {
//    final post = {'title': 'hello', 'name': 'welcome'};
//
//    print(post['title']);
//    String postJson = json.encode(post);
//    print(postJson is String);
//
//    final postJsonBackObj = json.decode(postJson);
//
//    print(postJsonBackObj is Map);
//
//    final postModel = PostModel.fromJson(postJsonBackObj);
//    print('name:${postModel.name}    ----------    title:${postModel.title}');

    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<PostModel> postModels = responseBody['posts']
          .map<PostModel>((item) => PostModel.fromJson(item))
          .toList();

      setState(() {
        beanList = postModels;
      });
      return postModels;
    } else {
      throw Exception('Post Is Failed.');
    }
  }
}

class PostModel {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  PostModel(this.id, this.title, this.description, this.author, this.imageUrl);

  PostModel.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];
}
