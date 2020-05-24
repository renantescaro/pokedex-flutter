import 'package:flutter/material.dart';
import 'package:pokemon/telas/listagem.dart';

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

  final TextEditingController txtPesquisa = new TextEditingController();

  pesquisaPokemon(){
    if(txtPesquisa.text == ''){
      mostrarMensagem('Pesquisa vazia!');
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Lista(txtPesquisa.text)),
      );
    }
  }

  Future<void> mostrarMensagem(mensagem) async{
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Text(mensagem)
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/pokeball.png'),height: 120,),
            Text(
              'Pesquise pelo nome do Pokemon',
              style: TextStyle(fontSize: 21),
            ),
            TextField(
              controller: txtPesquisa,
            ),
            RaisedButton(
              child: Text('Pesquisar', style: TextStyle(color: Colors.white)),
              onPressed: pesquisaPokemon,
              color: Colors.red,
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}