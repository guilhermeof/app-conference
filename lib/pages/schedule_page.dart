import 'package:flutter/material.dart';
import 'package:app_conference/model/schedules.dart';
import 'package:app_conference/pages/schedule/schedule_card.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with SingleTickerProviderStateMixin {

  TabController controller;
  List<Schedule> schedules;

  @override
  void initState() {
    super.initState();
    loadSchedule().then((result) {
      this.setState(() {
        schedules = result;
        if(schedules != null) {
          controller = new TabController(vsync: this, length: schedules.length);
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (schedules == null) {
      return new Scaffold(
        appBar: new AppBar(
          backgroundColor: new Color.fromRGBO(255, 22, 65, 10.0),
          title: new Text('Shchedule'.toUpperCase(), style: new TextStyle(
            letterSpacing: 8.0,
          ),
          ),
          centerTitle: true,
        ),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.event_busy, size: 100.0, color: Colors.grey,),
                new Text("Sem programações", style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey
                ),)
              ],
            ),
          ),
        ),
      );
    }

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
                              new Text(schedules.dia.toUpperCase()),
                              new Text(schedules.mes.toUpperCase())
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
              return new ScheduleCard(schedules: schedule.sessoes,);
            }).toList(),
          ),
    );
  }
}