import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoPage extends StatefulWidget {
  final String text;

  DemoPage(this.text);

  @override
  State<StatefulWidget> createState() {
    return _DemoPageWidgeState(text);
  }
}

class _DemoPageWidgeState extends State<DemoPage> {
  String text;
  String countString = '';
  String localString = '';

  _DemoPageWidgeState(this.text);

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = '值发生了变化';
      });
    });
  }

  //  initState 之后调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(30.0),
      width: 120,
      height: 500,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.black,
          border: new Border.all(color: Colors.amber, width: 3)),
      child: Text('666'),
    ));
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
      countString = prefs.getInt('counter').toString();
    });
  }
}
