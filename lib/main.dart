import 'package:my_dsi_app/aluno.dart';
import 'package:my_dsi_app/constants.dart';
import 'package:my_dsi_app/home.dart';
import 'package:my_dsi_app/login.dart';
import 'package:my_dsi_app/pessoa.dart';
import 'package:my_dsi_app/professor.dart';
import 'package:my_dsi_app/register.dart';
import 'package:flutter/material.dart';

void main() {
  _initDb();
  runApp(DSIApp());
}

class DSIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: _buildThemeData(),
      initialRoute: '/',
      routes: _buildRoutes(context),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.green,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
        caption: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 18.0),
        bodyText2: TextStyle(fontSize: 16.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        contentPadding: Constants.paddingMedium,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  _buildRoutes(context) {
    return {
      '/': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/home': (context) => HomePage(),
      '/list_pessoa': (context) => ListPessoaPage(),
      '/maintain_pessoa': (context) => MaintainPessoaPage(),
      '/list_aluno': (context) => ListAlunoPage(),
      '/maintain_aluno': (context) => MaintainAlunoPage(),
      '/maintain_professor': (context) => MaintainProfessorPage(),
      '/list_professor': (context) => ListProfessorPage(),
    };
  }
}

void _initDb() {
  for (var i = 1; i <= 20; i++) {
    var matricula = i.toString().padLeft(11, '0');
    var cpf = '${matricula.substring(0, 3)}.'
        '${matricula.substring(3, 6)}.'
        '${matricula.substring(6, 9)}-'
        '${matricula.substring(9)}';

    var aluno = Aluno(
      cpf: cpf,
      nome: 'Aluno $i',
      endereco: 'Rua $i, s/n.',
      matricula: matricula,
    );
    var siape = i.toString().padLeft(7, '0');
    var cpf_professor = siape+'0000';


    var professor = Professor(
      cpf: cpf_professor,
      nome: 'Professor $i',
      endereco: 'Rua $i, s/n.',
      siape: siape,
    );

    pessoaController.save(aluno);
    pessoaController.save(professor);
  }
}
