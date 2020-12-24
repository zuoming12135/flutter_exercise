import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:dio/dio.dart';


// 在FLutter有比较流行的一个网络框架库Dio

class HttpRequestDemo extends StatefulWidget {
  @override
  _HttpRequestDemoState createState() => _HttpRequestDemoState();
}


// ================== get请求 ==================
// 1.创建模型
class Album {
  int userId;
  int id;
  String title;

  Album({this.userId, this.id, this.title});

  Album.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

// 2. 构造httpget，发起请求，解析json
Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("request Failed");
  }
}

class _HttpRequestDemoState extends State<HttpRequestDemo> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {

    
    return RequestDemo2();
    return Center(
      child: Container(
        color: Colors.cyan,
        width: 200,
        height: 200,
        child: FutureBuilder(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("${snapshot.data.title}");
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}

// ================== 异步解析数据 ==================

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

List<Photo> parsePhotos(String responseBody) {
  // cast 检查输入是否都是String类型，输出都是dynamic类型

  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');
  // 另开一个isolate解析数据
  return compute(parsePhotos, response.body);
}

class RequestDemo2 extends StatelessWidget {
  final StringProperty title;

  const RequestDemo2({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchPhotos(http.Client()),
          builder: (context, snapShot) {
            if (snapShot.hasError) print(snapShot.error);

            return snapShot.hasData
                ? PhotosList(photos: snapShot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  const PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
      itemCount: photos.length,
    );
  }
}
