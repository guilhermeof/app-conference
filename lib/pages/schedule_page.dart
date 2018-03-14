import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 5);
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
        backgroundColor: Colors.redAccent,
        title: new Text("Schedule"),
        centerTitle: true,
        bottom: new PreferredSize(
          preferredSize: new Size.fromHeight(90.0),
          child: new Material(
            color: Colors.redAccent,
            child: new Container(
              padding: new EdgeInsets.only(bottom: 20.0),
              child: new TabBar(
              controller: controller,
              unselectedLabelColor: Colors.white,
              indicator: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              labelColor: Colors.redAccent,
              tabs: <Widget>[
                new Tab(icon: new Icon(null), child: new Container(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text("1"),
                      new Text("AUG")
                    ],
                  )
                )),
                new Tab( text: "2 AUG",),
                new Tab( text: "3 AUG",),
                new Tab( text: "4 AUG",),
                new Tab( text: "5 AUG",)
             ],
            ),
            )
          ),
        )
      ),
    );
  }
}
