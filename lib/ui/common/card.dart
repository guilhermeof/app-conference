import 'package:flutter/material.dart';
import 'package:app_conference/model/schedules.dart';
import 'package:app_conference/ui/common/separator.dart';
import 'package:app_conference/ui/detail/detail_page.dart';
import 'package:app_conference/ui/text_style.dart';

class CardSummary extends StatelessWidget {

  final Data schedule;
  final bool horizontal;

  CardSummary(this.schedule, {this.horizontal = true});

  CardSummary.vertical(this.schedule): horizontal = false;


  @override
  Widget build(BuildContext context) {
    final scheduleThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: 15.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "schedule-hero-${schedule.id}",
        child: new Image(
          image: new NetworkImage("https://avatars3.githubusercontent.com/u/19732467?s=460&v=4"),
          height: 50.0,
          width: 50.0,
        ),
      ),
    );



    Widget _scheduleValue({String value}) {
      return new Container(
        child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.timer, size: 16.0),
              new Container(width: 8.0),
              new Text(value, style: Style.smallTextStyle),
            ]
        ),
      );
    }


    final scheduleCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(schedule.nome, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(schedule.nome, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _scheduleValue(
                      value: schedule.inico,
                  )

              ),
              new Container (
                width: 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _scheduleValue(
                      value: schedule.termino,
                  )
              )
            ],
          ),
        ],
      ),
    );


    final scheduleCard = new Container(
      child: scheduleCardContent,
      alignment: Alignment.center,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 0.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 5.0),
          ),
        ],
      ),
    );


    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
          new PageRouteBuilder(
            pageBuilder: (_, __, ___) => new DetailPage(schedule),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            new FadeTransition(opacity: animation, child: child),
          ) ,
        )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              scheduleCard,
              scheduleThumbnail,
            ],
          ),
        )
    );
  }
}