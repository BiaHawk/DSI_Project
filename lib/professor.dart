import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_dsi_app/pessoa.dart';

class Professor {
  String id;
  String Siape;
  Pessoa pessoa;

  Professor({this.id, this.Siape, this.pessoa});

  Professor.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    Siape = json['Siape'];
  }

  Map<String, dynamic> toJson() => {'Siape': Siape};
}

ProfessorController professorController = ProfessorController();

class ProfessorController {
  CollectionReference professors;

  ProfessorController() {
    professors = FirebaseFirestore.instance.collection('professors');
  }

  DocumentReference getRef(String id) {
    return professors.doc(id);
  }

  FutureOr<Professor> fromJson(DocumentSnapshot snapshot) async {
    Map<String, dynamic> data = snapshot.data();
    Professor professor = Professor.fromJson(data);
    professor.id = snapshot.id;
    DocumentReference ref = data['pessoa'];
    professor.pessoa = pessoaController.fromJson(await ref.get());
    return professor;
  }

  Map<String, dynamic> toJson(Professor professor) {
    DocumentReference ref = pessoaController.getRef(professor.pessoa.id);
    return professor.toJson()..putIfAbsent('pessoa', () => ref);
  }

  FutureOr<List<FutureOr<Professor>>> getAll() async {
    QuerySnapshot documents = await professors.get();
    FutureOr<List<FutureOr<Professor>>> result =
    documents.docs.map(fromJson).toList();
    return result;
  }

  FutureOr<Professor> getById(String id) async {
    DocumentSnapshot doc = await professors.doc(id).get();
    return fromJson(doc);
  }

  Future<void> remove(FutureOr<Professor> professor) async {
    Professor a = await professor;
    //TIP idealmente as duas linhas abaixo deveriam ser executadas
    //em uma única transação
    Future<void> result = professors.doc(a.id).delete();
    pessoaController.remove(a.pessoa);
    return result;
  }

  Future<Professor> save(FutureOr<Professor> professor) async {
    Professor a = await professor;
    a.pessoa = await pessoaController.save(a.pessoa);
    Map<String, dynamic> data = toJson(a);
    if (a.id == null) {
      DocumentReference ref = await professors.add(data);
      return fromJson(await ref.get());
    } else {
      professors.doc(a.id).update(data);
      return a;
    }
  }
}
