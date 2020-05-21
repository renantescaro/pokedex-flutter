import 'package:flutter/material.dart';

class Inicial extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
    home: InicialPage(),
    );
  }
}

class InicialPage extends StatefulWidget{
  @override
  InicialPageState createState() => InicialPageState();
}

class InicialPageState extends State<InicialPage>{
  buscarPokemon(){

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Busca por Pokemon',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              
            ),
            RaisedButton(
              child: Text('Buscar', style: TextStyle(color: Colors.white)),
              onPressed: buscarPokemon,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}