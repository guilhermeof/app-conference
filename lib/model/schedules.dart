import 'package:app_conference/model/loadjson.dart';

class Schedule {
  final String id;
  final String nome;
  final String local;
  final String descricao;
  final String palestrantes;
  final String inicio;
  final String termino;
  final String tag;

  Schedule({this.id, this.nome, this.local, this.descricao, this.palestrantes,
    this.inicio, this.termino, this.tag});
}


//List<Schedule> schedules = [
//  const Schedule(
//    id: "1",
//    nome: "Palestra 1",
//    local: "Sala 202",
//    descricao: "shooow",
//    palestrantes: "Guilherme Oliveira",
//    inicio: "10:00",
//    termino: "11:00",
//    tag: "palestra"
//  ),
//  const Schedule(
//      id: "2",
//      nome: "Palestra 2",
//      local: "Sala 202",
//      descricao: "shooow",
//      palestrantes: "Guilherme Oliveira",
//      inicio: "10:00",
//      termino: "11:00",
//      tag: "palestra"
//  ),
//  const Schedule(
//      id: "3",
//      nome: "Palestra 3",
//      local: "Sala 202",
//      descricao: "shooow",
//      palestrantes: "Guilherme Oliveira",
//      inicio: "10:00",
//      termino: "11:00",
//      tag: "palestra"
//  ),
//  const Schedule(
//      id: "4",
//      nome: "Palestra 4",
//      local: "Sala 202",
//      descricao: "shooow",
//      palestrantes: "Guilherme Oliveira",
//      inicio: "10:00",
//      termino: "11:00",
//      tag: "palestra"
//  ),
//  const Schedule(
//      id: "5",
//      nome: "Palestra 5",
//      local: "Sala 202",
//      descricao: "shooow",
//      palestrantes: "Guilherme Oliveira",
//      inicio: "10:00",
//      termino: "11:00",
//      tag: "palestra"
//  ),
//  const Schedule(
//      id: "6",
//      nome: "Palestra 6",
//      local: "Sala 202",
//      descricao: "shooow",
//      palestrantes: "Guilherme Oliveira",
//      inicio: "10:00",
//      termino: "11:00",
//      tag: "palestra"
//  ),
//];