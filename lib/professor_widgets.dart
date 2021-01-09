import 'package:my_dsi_app/aluno.dart';
import 'package:my_dsi_app/constants.dart';
import 'package:my_dsi_app/dsi_widgets.dart';
import 'package:my_dsi_app/infra.dart';
import 'package:my_dsi_app/pessoa.dart';
import 'package:my_dsi_app/pessoa_widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_dsi_app/professor.dart';

class ListProfessorPage extends StatefulWidget {
  @override
  DsiListPageState<Professor, ListProfessorPage> createState() =>
      DsiListPageState<Professor, ListProfessorPage>(
        title: 'Lista de Professores',
        listDataBuilder: () => professorController.getAll(),
        remover: (context, object) => professorController.remove(object),
        builder: (context, object) {
          return DsiFutureBuilder(
            key: UniqueKey(),
            target: object,
            builder: (context, professor) => ListTile(
              title: Text(professor.pessoa.nome),
              subtitle: Text('mat. ${professor.Siape}'),
              onTap: () =>
                  dsiHelper.go(context, "/maintain_professor", arguments: professor),
            ),
          );
        },
        floatingActionButtonBuilder: (context) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => dsiHelper.go(context, '/maintain_professor'),
        ),
      );
}

class MaintainProfessorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Professor professor = dsiHelper.getRouteArgs(context);
    if (professor == null) {
      professor = Professor();
      professor.pessoa = Pessoa();
    }

    return DsiBasicFormPage(
      title: 'Professor',
      onSave: (context) {
        professorController.save(professor).then((value) {
          dsiHelper.go(context, '/list_professor');
        });
      },
      body: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: Constants.boxSmallHeight.height,
        children: <Widget>[
          MaintainPessoaBody(professor.pessoa),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'SIAPE*'),
            validator: (String value) {
              return value.isEmpty ? 'SIAPE inválido.' : null;
            },
            initialValue: professor.Siape,
            onSaved: (newValue) => professor.Siape = newValue,
          ),
        ],
      ),
    );
  }
}
