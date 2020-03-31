import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "My APP",
    home: new Counter(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //decoration装饰
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        // <Widget>[] 列表
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, //禁用
          ),
          new Expanded(
            child: Text("data"),
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: "search",
            onPressed: null,
          )
        ],
      ),
    ));
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new AppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.subtitle,
            ),
          ),
          new Expanded(
            child: new Center(
              child: Text('hello world1111'),
            ),
          )
        ],
      ),
    );
  }
}

/**
 * 手势
 */

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('my button is ontap');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(16.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(15.0),
          color: Colors.blue,
        ),
        child: new Center(
          child: new Text('En2gage'),
        ),
      ),
    );
  }
}

/**
 * 输入
 */

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      ++_count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CounterIncrementor(
          onPressid: _increment,
        ),
        new CounterDisplay(count: _count)
      ],
    );
  }
}
/**
 * 显示计数器
 */
class CounterDisplay extends StatelessWidget {
  const CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('count---$count');
  }
}
/**
 * 更改计数器
 */
class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressid;
  const CounterIncrementor({this.onPressid});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressid,
      child: new Text('Increment'),
    );
  }
}
