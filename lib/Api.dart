import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon/Pokemon.dart';
import 'dart:developer' as developer;

class Api{
  final String urlApi = 'http://192.168.1.207';

  Future<List<Pokemon>> consultarPokemonPorNome(String nome) async{
    dynamic resposta = await getHttp(urlApi+'/?consultar-pokemon-nome&nome='+nome);
    List respostaJson = json.decode(resposta);

    return respostaJson.map((pokemon)=>new Pokemon.fromJson(pokemon)).toList();
  }

  getHttp(url) async{
    try{
      final response = await http.get(url, headers:{"Accept":"application/json"});

      if(response.statusCode==200){
        return response.body;
      }else{
        return jsonEncode({
          'status'  :false,
          'mensagem':'erro resposta servidor',
        });
      }
    }catch(e){
      return jsonEncode({
        'status'  :false,
        'mensagem':'erro ao acessar servidor',
      });
    }
  }
}