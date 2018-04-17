import 'package:flutter/material.dart';
import 'package:app_conference/ui/common/card.dart';

class ScheduleCard extends StatelessWidget {
  final List<Object> schedules;

  ScheduleCard({ this.schedules });

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Container(
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                      (context, index) => new CardSummary(schedules[index]),
                  childCount: schedules.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}