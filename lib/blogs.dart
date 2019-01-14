import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class BlogList extends StatefulWidget {
  BlogList({Key key, this.title}) : super(key: key);
  final String title;
  @override
  BlogState createState() => BlogState();


}

class BlogState extends State<BlogList> {
  List blogs = List();
  bool isLoading = false;
  @override
  void initState(){
    super.initState();
    blogs=getBlogs();
  }

  getBlogs() {
    setState(() {
      isLoading = true;
    });
    get("https://jsonplaceholder.typicode.com/posts").then((response) {
      blogs =  (json.decode(response.body) as List)
          .map((data) => new Blog.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Blog List"),
        ),
        body: isLoading
            ? Center(child: Text("Loading Blogs"))
            : ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(blogs[index].title),
                  );
                },
              ));
  }
}

class Blog {
  final String title;
  final String thumbnailUrl;
Blog._({this.title, this.thumbnailUrl});
factory Blog.fromJson(Map<String, dynamic> json) {
    return new Blog._(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
