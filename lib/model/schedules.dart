import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class Schedule {
  final String dia;
  final String mes;
  final List<Data> grupos;

  Schedule({this.dia, this.mes, this.grupos});
}

class Data {
  final String horario;
  final String nome;
  final String local;
  final String descricao;
  final Object palestrantes;
  final String inico;
  final String termino;
  final String tag;

  Data({this.horario, this.nome, this.local, this.descricao, this.palestrantes,
  this.inico, this.termino, this.tag});
}

List<Schedule> schedules = <Schedule>[
  new Schedule(
    dia: "1",
    mes: "MAR",
    grupos: [new Data(
        horario: "9:00",
        nome: "Palestra 1",
        local: "Sala 100",
        descricao: "Descrição da palestra",
        palestrantes: "Guilherme Oliveira",
        inico: "9:30",
        termino: "10:00",
        tag: "palestra"
    )]
  ),
  new Schedule(
      dia: "2",
      mes: "MAR",
      grupos: [new Data(
          horario: "9:00",
          nome: "Palestra 2",
          local: "Sala 203",
          descricao: "Descrição da palestra",
          palestrantes: "Guilherme Oliveira",
          inico: "9:30",
          termino: "10:00",
          tag: "palestra"
      )]
  )
];

Future<String> _loadAsset() async {
  return await rootBundle.loadString('assets/database/schedule_database.json');
}

_parseJson(String jsonString) {
  Map decoded = JSON.decode(jsonString);
  var schedule = decoded['schedule'];

  List<Schedule> schedules = new List<Schedule>();
//  List<Data> datas = new List<Data>();

  for (var sch in schedule) {
    for (var grp in sch['grupos']) {
      for (var sess in grp['sessoes']) {
        schedules.add(new Schedule(
            dia: sch['dia'],
            mes: sch['mes'],
            grupos: [new Data(
                horario: grp['horario'],
                nome: sess['nome'],
                local: sess['local'],
                descricao: sess['descricao'],
                palestrantes: sess['palestrantes'],
                inico: sess['inicio'],
                termino: sess['termino'],
                tag: sess['tag']
            )]));
      }
    }
  }

  print(schedules);
  return schedules;
}

loadSchedule() async {
  String json = await _loadAsset();
  var schedule = _parseJson(json);

  return schedule;
}

