import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class Schedule {
  final String dia;
  final String mes;
  final List<Data> sessoes;

  Schedule({this.dia, this.mes, this.sessoes});
}

class Data {
  final String nome;
  final String local;
  final String descricao;
  final Object palestrantes;
  final String inico;
  final String termino;
  final String tag;

  Data(
      {
      this.nome,
      this.local,
      this.descricao,
      this.palestrantes,
      this.inico,
      this.termino,
      this.tag});
}


Future<String> _loadAsset() async {
  return await rootBundle.loadString('assets/database/schedule_database.json');
}

_parseJson(String jsonString) {
  Map decoded = json.decode(jsonString);
  var days = decoded['schedule'];

  List<Schedule> schedules = new List<Schedule>();

  for (var day in days) {
    List<Data> datas = new List<Data>();

    day['sessoes'].forEach((item) {
      datas.add(new Data(
          nome: item['nome'],
          local: item['local'],
          descricao: item['descricao'],
          palestrantes: item['palestrantes'],
          inico: item['inicio'],
          termino: item['termino'],
          tag: item['tag']));
    });

    schedules.add(new Schedule(dia: day['dia'], mes: day['mes'], sessoes: datas));
  }

  return schedules;
}

Future<List<Schedule>> loadSchedule() async {
  String json = await _loadAsset();
  var schedule = _parseJson(json);

  return schedule;
}
