import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "My APP",
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({this.title});

  final Widget title;
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      child :new Container(
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
    )
    );
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
