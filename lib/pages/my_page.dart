import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static const plantform = const MethodChannel('app.channel.shared.data');
  String dataShared = 'no data';

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              margin: EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  FlatButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/demopage')},
                      child: Text(dataShared)),
                  FlatButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/demosppage')},
                      child: Text('demosppage')),
                ],
              ))),
    );
  }

//通过MethodChannel获取Activity中接收的值
  void getSharedText() async {
    var sharedData = await plantform.invokeMethod('getSharedText');
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}
