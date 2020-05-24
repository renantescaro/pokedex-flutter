import 'package:flutter/material.dart';
import 'package:pokemon/Api.dart';
import 'package:pokemon/Pokemon.dart';


class Lista extends StatefulWidget{

  final String pesquisa;
  Lista(this.pesquisa);

  @override
  ListaState createState() => ListaState(this.pesquisa);
}

class ListaState extends State<Lista>{

  final String pesquisa;
  ListaState(this.pesquisa);

  Api api = new Api();

  ListView pokeListView(data){
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(data[index].nome),
          subtitle: Text(data[index].tipo),
          onTap: () => mostrarMensagem(data[index], context),
        );
      },
    );
  }

  teste(){

  }

  mostrarMensagem(pokemon, context){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(pokemon.nome)),
          content: Column(
            children: <Widget>[
              Image.network(pokemon.urlImagem),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Resultado pesquisa',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Resultado pesquisa'),
        ),
        body: Container(
          child: FutureBuilder<List<Pokemon>>(
            future: api.consultarPokemonPorNome(pesquisa),
            builder: (context,snapshot){
              if(snapshot.hasData){
                List<Pokemon> data = snapshot.data;
                return pokeListView(data);
              }
              return CircularProgressIndicator();
            }
          )
        ),
      ),
    );
  }
}