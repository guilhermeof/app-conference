import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<String> _loadAsset() async {
  return await rootBundle.loadString('assets/database/schedule_database.json');
}

 _parseJson(String jsonString) {
  Map decoded = JSON.decode(jsonString);
  var ok = decoded['schedule'];
  
  return ok;
}

Future loadSchedule() async {
  String json = await _loadAsset();
  var scheduleDate = _parseJson(json);

  return scheduleDate;

}