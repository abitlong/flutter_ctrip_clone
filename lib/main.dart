import 'package:flutter/material.dart';

import 'navigator/tab_navigator.dart';
import 'pages/demo_page.dart';
import 'pages/demo_sp_page.dart';
import 'pages/home_page.dart';
import 'pages/my_page.dart';
import 'pages/search_page.dart';
import 'pages/travel_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
      // 添加所有路由
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => HomePage(),
        '/searchpage': (BuildContext context) => SearchPage(),
        '/travelpage': (BuildContext context) => TravelPage(),
        '/mypage': (BuildContext context) => MyPage(),
        '/demopage': (BuildContext context) => DemoPage('initDate'),
        '/demosppage': (BuildContext context) => DemoSPPage(),
      },
    );
  }
}
