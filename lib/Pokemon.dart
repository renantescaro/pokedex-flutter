class Pokemon{
  String nome;
  String tipo;
  String urlImagem;

  Pokemon({this.nome,this.tipo, this.urlImagem});

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      nome:json['nome'],
      tipo:json['tipo'],
      urlImagem: json['imagem']
    );
  }
}