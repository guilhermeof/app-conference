import 'package:flutter/material.dart';
import 'FirstPage.dart' as first;
import 'SecondPage.dart' as second;
import 'ThirdPage.dart' as third;

void main() => runApp(new MaterialApp(
  home: new MyTabs(),
));

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pages"),
        backgroundColor: Colors.deepOrange,
        bottom: new TabBar(
          controller: _tabController,
            tabs: <Tab>[
              new Tab(icon: new Icon(Icons.home), text: "Home"),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back)),
            ]
        ),
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          indicatorPadding: EdgeInsets.zero,
            controller: _tabController,
            tabs: <Tab>[
              new Tab(icon: new Icon(Icons.home)),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back)),
            ]
        ),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new first.First(),
            new second.Second(),
            new third.Third()
          ]
      ),
    );
  }
}