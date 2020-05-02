import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AppBarBottomSample(),
    );
  }
}

class AppBarBottomSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppBarBottomSampleState();
  }
}

class _AppBarBottomSampleState extends State<AppBarBottomSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: choices.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void nextPage(int delta) {
    final newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= choices.length) {
      return;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Bottom Widget'),
        leading: new IconButton(
            tooltip: 'Previous choice',
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              nextPage(-1);
            }),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {
                nextPage(1);
              })
        ],
        bottom: new PreferredSize(
            child: new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: new Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: new TabPageSelector(
                    controller: _tabController,
                  ),
                )),
            preferredSize: Size.fromHeight(48.0)),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices.map((Choice choice) {
          return new Padding(
            padding: EdgeInsets.all(16.0),
            child: new ChoiceCard(choice),
          );
        }).toList(),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  // const Choice(this.title, this.icon);
  const Choice({this.title, this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  final Choice _choiceCard;

  ChoiceCard(this._choiceCard);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              _choiceCard.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            Text(
              _choiceCard.title,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
