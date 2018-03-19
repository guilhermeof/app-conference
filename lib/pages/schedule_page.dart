import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'dart:convert';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin {

  TabController controller;
  final length = schedules.length;

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
                  tabs: schedules.map((Schedule schedules) {
                  return new Tab(
                      child: new Align(
                        alignment: Alignment.bottomCenter,
                        child: new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                              new Text(schedules.name.toUpperCase()),
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
            children: schedules.map((Schedule schedule) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ScheduleCard(schedule: schedule),
              );
            }).toList(),
          ),
    );
  }
}

class Schedule {
  
  final String name;
  final String local;
  final String descricao;
  final Object palestrantes;
  final String inicio;
  final String termino;
  final IconData icon;
  final Widget child;
  
  Schedule({
     this.name,
     this.local, 
     this.descricao, 
     this.palestrantes, 
     this.inicio,
     this.termino,
     this.icon,
     this.child
      });
 
}

// void _parseJsonForCrossword(String jsonString) {
//   Map decoded = JSON.decode(jsonString);

//   String name = decoded["name"];

//   for (var item in decoded["sessoes"]) {
//     print(item["name"]);
//   }
// }

// Future<String> _loadCrosswordAsset() async {
//   return await rootBundle.loadString('assets/database/schedule_database.json');
// }

// Future loadCrossword() async {
//   String jsonCrossword = await _loadCrosswordAsset();
//    _parseJsonForCrossword(jsonCrossword);
// }


List<Schedule> schedules = <Schedule>[
  new Schedule(name: '2', 
  child: new Container(
     child: new Center(
       child: new Text("data"),),)),
  new Schedule(name: '3', icon: Icons.filter_1),
  new Schedule(name: '4', icon: Icons.filter_1),
  new Schedule(name: '5', icon: Icons.filter_1),
];

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({ Key key, this.schedule }) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    loadCrossword();
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            schedule.child
          ],
        ),
      ),
    );
  }
}


class Crossword {
  // final int id;
  final String name;
  final Across across;

  Crossword(this.name, this.across);
}

class Across {
  final List<Word> words;

  const Across(this.words);
}

class Word {
  // final int number;
  final String name;

  const Word(this.name);
}

Future<String> _loadCrosswordAsset() async {
  return await rootBundle.loadString('assets/database/schedule_database.json');
}

Crossword _parseJsonForCrossword(String jsonString) {
  Map decoded = JSON.decode(jsonString);

  List<Word> words = new List<Word>();
  for (var word in decoded['sessoes']) {
    words.add(new Word(word['name']));
  }
  
  return new Crossword(decoded['name'], new Across(words));
}

Future loadCrossword() async {
  String jsonCrossword = await _loadCrosswordAsset();
  Crossword crossword = _parseJsonForCrossword(jsonCrossword);

  // We check it's working
  print(crossword.name);

  // Crossword is loaded from JSON, do what you want with it now :-)
}