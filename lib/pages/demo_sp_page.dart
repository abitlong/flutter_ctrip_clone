import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//shared preference使用
class DemoSPPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoSPPageWidgeState();
  }
}

class _DemoSPPageWidgeState extends State<DemoSPPage> {
  String text;
  String countString = '';
  String localCount = '';

  @override
  void initState() {
    super.initState();
  }

  //  initState 之后调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _incrementCounter,
              child: Text('增加计数'),
            ),
            RaisedButton(
              onPressed: _getCounter,
              child: Text('获取计数'),
            ),
            Text(countString),
            Text('result' + localCount)
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + '1';
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
