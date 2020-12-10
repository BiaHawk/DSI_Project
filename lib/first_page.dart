import 'package:flutter/material.dart';

import 'main.dart';
import 'main.dart';
import 'main.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.cyan,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Alimente o Totodile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alimente o Totodile'),
          backgroundColor: Colors.cyan,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('images/totodile .png'),
                ),
              ),
              Container(
                child: Text('Você alimentou o Totodile '+'$_counter'+' vez(es)', style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
                ),
              ),
              FlatButton(color: Colors.cyan,
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DSIPage(title: 'My First App - DSI/BSI/UFRPE')),)
                }, child: Text("Já chega?"),),
            ],
          ),
        ),

        //Para não criar outra pasta, editei o botão aqui mesmo
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          label: Text('Alimentar'),
          icon: Icon(Icons.restaurant),
          backgroundColor: Colors.cyan,
          splashColor: Colors.cyanAccent,
        ),
      ),
    );
  }
}
