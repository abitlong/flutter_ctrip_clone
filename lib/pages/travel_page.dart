import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TravelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  String showResult = '';

  //发起请求
  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
//    final result = json.decode(response.body);
    //中文乱码处理
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Future与FutureBuilder实用技巧'),
          ),
          body: FutureBuilder<CommonModel>(
            future: fetchPost(),
            builder:
                (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('input a url to start');
                case ConnectionState.waiting:
                  return new Center(
                    child: new CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return new Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return new Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return new Column(
                      children: <Widget>[
                        Text('icon:${snapshot.data.icon}'),
                        Text('statusBarColor:${snapshot.data.statusBarColor}'),
                        Text('title:${snapshot.data.title}'),
                        Text('url:${snapshot.data.url}'),
                      ],
                    );
                  }
              }
            },
          )),
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar']);
  }
}
