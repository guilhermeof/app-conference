import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin {

  TabController controller;
  final length = choices.length;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: length);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
          appBar: new AppBar(
            backgroundColor: new Color.fromRGBO(255, 22, 65, 10.0),
            title: new Text('Shchedule'.toUpperCase(), style: new TextStyle(
              letterSpacing: 8.0,
            ),),
            centerTitle: true,
            bottom: new PreferredSize(
              preferredSize: new Size.fromHeight(80.0),
              child: new Container(
                padding: new EdgeInsets.only(bottom: 20.0),
                child: new TabBar(
                  labelStyle: new TextStyle(
                    fontSize: 14.0
                  ),
                  indicatorWeight: 8.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.white,
                  labelColor: new Color.fromRGBO(255, 22, 65, 10.0),
                  indicator: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                        new BoxShadow (
                          color: const Color(0xcc000000),
                          offset: new Offset(0.0, 0.1),
                          blurRadius: 0.1,
                        ),
                      ], 
                    ),
                  controller: controller,
                  isScrollable: true,
                  tabs: choices.map((Choice choice) {
                  return new Tab(
                      child: new Align(
                        alignment: Alignment.bottomCenter,
                        child: new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                              new Text(choice.title.toUpperCase()),
                              new Text("AUG".toUpperCase())
                            ],
                          )
                        ),
                      )
                    );
                 }).toList(),
               ),
              ),
            ),
          ),
          body: new TabBarView(
            controller: controller,
            children: choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
    );
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '1', icon: Icons.filter_1),
  const Choice(title: '2', icon: Icons.filter_1),
  const Choice(title: '3', icon: Icons.filter_1),
  const Choice(title: '4', icon: Icons.filter_1),
  const Choice(title: '5', icon: Icons.filter_1),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

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
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
