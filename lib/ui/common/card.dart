import 'package:flutter/material.dart';
import 'package:app_conference/model/schedules.dart';
import 'package:app_conference/ui/common/separator.dart';
import 'package:app_conference/ui/detail/detail_page.dart';
import 'package:app_conference/ui/text_style.dart';

class CardSummary extends StatelessWidget {

  final Schedule schedule;
  final bool horizontal;

  CardSummary(this.schedule, {this.horizontal = true});

  CardSummary.vertical(this.schedule): horizontal = false;


  @override
  Widget build(BuildContext context) {

    final scheduleThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
//      child: new Hero(
//        tag: "schedule-hero-${schedule.id}",
//        child: new Image(
//          image: new NetworkImage("https://cdn.pixabay.com/photo/2016/03/31/19/57/avatar-1295406_960_720.png"),
//          height: 92.0,
//          width: 92.0,
//        ),
//      ),
    );



    Widget _scheduleValue({String value, String image}) {
      return new Container(
        child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//              new Image.asset(image, height: 12.0),
              new Container(width: 8.0),
              new Text(schedule.termino, style: Style.smallTextStyle),
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
          new Text(schedule.local, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _scheduleValue(
                      value: schedule.inicio,
//                      image: 'assets/img/ic_distance.png'
                  )

              ),
              new Container (
                width: 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _scheduleValue(
                      value: schedule.termino,
//                      image: 'assets/img/ic_gravity.png'
                  )
              )
            ],
          ),
        ],
      ),
    );


    final scheduleCard = new Container(
      child: scheduleCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
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